import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/colors.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/providers/providers.dart';
import 'data/database/database.dart';
import 'data/repositories/trade_repository.dart';
import 'data/repositories/strategy_repository.dart';
import 'data/repositories/review_repository.dart';
import 'data/seed/sample_data_seeder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style to dark with gold accents
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.secondaryBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  final sharedPrefs = await SharedPreferences.getInstance();
  final db = AppDatabase();

  // Seed default strategies and initial demo trades
  try {
    final tradeRepo = TradeRepository(db);
    final strategyRepo = StrategyRepository(db);
    final reviewRepo = DailyReviewRepository(db);

    await SampleDataSeeder.seedInitialData(
      tradeRepo: tradeRepo,
      strategyRepo: strategyRepo,
      reviewRepo: reviewRepo,
    );
  } catch (e, stack) {
    debugPrint('Error during sample data seeding: $e\n$stack');
  }

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
        appDatabaseProvider.overrideWithValue(db),
      ],
      child: const TradeTrackApp(),
    ),
  );
}

class TradeTrackApp extends StatelessWidget {
  const TradeTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trade Track',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
