import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/database/database.dart';
import '../../data/repositories/trade_repository.dart';
import '../../data/repositories/strategy_repository.dart';
import '../../data/repositories/review_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';
import '../../domain/models/financial_summary.dart';
import '../../domain/models/strategy_model.dart';
import '../../domain/models/app_settings_model.dart';
import '../../domain/engine/trading_calculation_engine.dart';

// Core Singletons
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden at main()');
});

// Repositories
final tradeRepositoryProvider = Provider<TradeRepository>((ref) {
  return TradeRepository(ref.watch(appDatabaseProvider));
});

final strategyRepositoryProvider = Provider<StrategyRepository>((ref) {
  return StrategyRepository(ref.watch(appDatabaseProvider));
});

final reviewRepositoryProvider = Provider<DailyReviewRepository>((ref) {
  return DailyReviewRepository(ref.watch(appDatabaseProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(sharedPreferencesProvider),
  );
});

// App Settings State
class SettingsNotifier extends StateNotifier<AppSettingsModel> {
  final SettingsRepository _repo;

  SettingsNotifier(this._repo, AppSettingsModel initial) : super(initial);

  Future<void> updateSettings(AppSettingsModel newSettings) async {
    state = newSettings;
    await _repo.saveSettings(newSettings);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, AppSettingsModel>((ref) {
      final repo = ref.watch(settingsRepositoryProvider);
      return SettingsNotifier(repo, const AppSettingsModel());
    });

// Reactive Streams
final allTradesStreamProvider = StreamProvider<List<TradeModel>>((ref) {
  return ref.watch(tradeRepositoryProvider).watchAllTrades();
});

final allStrategiesStreamProvider = StreamProvider<List<StrategyModel>>((ref) {
  return ref.watch(strategyRepositoryProvider).watchAllStrategies();
});

// Dashboard Filter State
final dashboardDateRangeProvider = StateProvider<DateRangeFilter>(
  (ref) => DateRangeFilter.thisMonth,
);
final dashboardCustomRangeProvider = StateProvider<DateTimeRange?>(
  (ref) => null,
);

// Dashboard Computed Data
final dashboardFilteredTradesProvider = Provider<List<TradeModel>>((ref) {
  final allTrades = ref.watch(allTradesStreamProvider).value ?? [];
  final dateRange = ref.watch(dashboardDateRangeProvider);
  final customRange = ref.watch(dashboardCustomRangeProvider);
  final repo = ref.watch(tradeRepositoryProvider);

  return repo.filterTrades(
    allTrades,
    dateRange: dateRange,
    customRange: customRange,
  );
});

final dashboardSummaryProvider = Provider<FinancialSummary>((ref) {
  final trades = ref.watch(dashboardFilteredTradesProvider);
  final settings = ref.watch(settingsProvider);
  return TradingCalculationEngine.calculateSummary(
    trades,
    startingCapital: settings.startingCapital,
  );
});

// Journal Filter State
final journalSearchQueryProvider = StateProvider<String>((ref) => '');
final journalMarketFilterProvider = StateProvider<MarketType?>(
  (ref) => null,
); // null = All
final journalStrategyFilterProvider = StateProvider<String?>((ref) => null);
final journalOutcomeFilterProvider = StateProvider<TradeOutcome?>(
  (ref) => null,
);

final journalFilteredTradesProvider = Provider<List<TradeModel>>((ref) {
  final allTrades = ref.watch(allTradesStreamProvider).value ?? [];
  final search = ref.watch(journalSearchQueryProvider);
  final market = ref.watch(journalMarketFilterProvider);
  final strategy = ref.watch(journalStrategyFilterProvider);
  final outcome = ref.watch(journalOutcomeFilterProvider);
  final repo = ref.watch(tradeRepositoryProvider);

  return repo.filterTrades(
    allTrades,
    dateRange: DateRangeFilter.allTime,
    searchQuery: search,
    market: market,
    strategy: strategy,
    outcome: outcome,
  );
});

// Analytics Filter State ('1M', '3M', '6M', '1Y', 'All')
final analyticsTimeframeProvider = StateProvider<String>((ref) => '1M');

final analyticsFilteredTradesProvider = Provider<List<TradeModel>>((ref) {
  final allTrades = ref.watch(allTradesStreamProvider).value ?? [];
  final timeframe = ref.watch(analyticsTimeframeProvider);
  final now = DateTime.now();

  return allTrades.where((t) {
    if (timeframe == '1M') {
      return t.tradeDate.isAfter(now.subtract(const Duration(days: 30)));
    } else if (timeframe == '3M') {
      return t.tradeDate.isAfter(now.subtract(const Duration(days: 90)));
    } else if (timeframe == '6M') {
      return t.tradeDate.isAfter(now.subtract(const Duration(days: 180)));
    } else if (timeframe == '1Y') {
      return t.tradeDate.isAfter(now.subtract(const Duration(days: 365)));
    }
    return true; // 'All'
  }).toList();
});

final analyticsSummaryProvider = Provider<FinancialSummary>((ref) {
  final trades = ref.watch(analyticsFilteredTradesProvider);
  final settings = ref.watch(settingsProvider);
  return TradingCalculationEngine.calculateSummary(
    trades,
    startingCapital: settings.startingCapital,
  );
});

final strategyStatsListProvider = Provider<List<StrategyStats>>((ref) {
  final strategies = ref.watch(allStrategiesStreamProvider).value ?? [];
  final trades = ref.watch(allTradesStreamProvider).value ?? [];

  return strategies
      .map((s) => TradingCalculationEngine.calculateStrategyStats(s, trades))
      .toList()
    ..sort((a, b) => b.netPnL.compareTo(a.netPnL));
});
