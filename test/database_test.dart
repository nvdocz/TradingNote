import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradetrack_journal/data/database/database.dart';
import 'package:tradetrack_journal/data/repositories/trade_repository.dart';
import 'package:tradetrack_journal/data/repositories/strategy_repository.dart';
import 'package:tradetrack_journal/data/repositories/review_repository.dart';
import 'package:tradetrack_journal/domain/models/trade_model.dart';
import 'package:tradetrack_journal/domain/models/trade_enums.dart';
import 'package:tradetrack_journal/domain/models/strategy_model.dart';
import 'package:tradetrack_journal/domain/models/daily_review_model.dart';

void main() {
  late AppDatabase db;
  late TradeRepository tradeRepo;
  late StrategyRepository strategyRepo;
  late DailyReviewRepository reviewRepo;

  setUp(() {
    // In-memory SQLite database for robust isolated testing
    db = AppDatabase(NativeDatabase.memory());
    tradeRepo = TradeRepository(db);
    strategyRepo = StrategyRepository(db);
    reviewRepo = DailyReviewRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('Drift SQLite Database Integration Tests', () {
    test('Create, retrieve, update, and delete trade', () async {
      final now = DateTime(2025, 1, 15, 10, 30);
      final trade = TradeModel(
        id: 'trade_1',
        tradeDate: now,
        symbol: 'RELIANCE',
        market: MarketType.nse,
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        exitPrice: 2920.0,
        quantity: 10.0,
        strategy: 'Breakout',
        totalCosts: 50.0,
        grossPnL: 700.0,
        netPnL: 650.0,
        status: TradeStatus.closed,
        outcome: TradeOutcome.win,
        createdAt: now,
        updatedAt: now,
      );

      // Insert
      await tradeRepo.insertTrade(trade);
      var fetched = await tradeRepo.getTradeById('trade_1');
      expect(fetched, isNotNull);
      expect(fetched!.symbol, 'RELIANCE');
      expect(fetched.netPnL, 650.0);

      // Update
      final updatedTrade = fetched.copyWith(netPnL: 800.0, exitPrice: 2935.0);
      await tradeRepo.updateTrade(updatedTrade);
      fetched = await tradeRepo.getTradeById('trade_1');
      expect(fetched!.netPnL, 800.0);
      expect(fetched.exitPrice, 2935.0);

      // Delete
      await tradeRepo.deleteTrade('trade_1');
      fetched = await tradeRepo.getTradeById('trade_1');
      expect(fetched, isNull);
    });

    test('Create and retrieve strategies', () async {
      final strategy = StrategyModel(
        id: 's1',
        name: 'Breakout',
        colorHex: '#27C982',
        market: MarketType.nse,
        createdAt: DateTime.now(),
      );

      await strategyRepo.insertStrategy(strategy);
      final list = await strategyRepo.getAllStrategies();
      expect(list.length, 1);
      expect(list.first.name, 'Breakout');
    });

    test('Save and query daily review for date', () async {
      final date = DateTime(2025, 1, 15);
      final review = DailyReviewModel(
        id: 'rev_1',
        reviewDate: date,
        reflection: 'Strictly followed risk plan.',
        disciplineScore: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await reviewRepo.saveReview(review);
      final fetched = await reviewRepo.getReviewForDate(date);
      expect(fetched, isNotNull);
      expect(fetched!.disciplineScore, 5);
      expect(fetched.reflection, 'Strictly followed risk plan.');
    });

    test('Batch insert and wipe all trades', () async {
      final trades = List.generate(5, (index) {
        return TradeModel(
          id: 'trade_$index',
          tradeDate: DateTime.now(),
          symbol: 'SYM_$index',
          market: MarketType.nse,
          direction: TradeDirection.buy,
          entryPrice: 100.0,
          quantity: 10.0,
          strategy: 'Breakout',
          totalCosts: 0.0,
          grossPnL: 0.0,
          netPnL: 0.0,
          status: TradeStatus.open,
          outcome: TradeOutcome.open,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      });

      await tradeRepo.batchInsert(trades);
      var all = await tradeRepo.getAllTrades();
      expect(all.length, 5);

      await tradeRepo.deleteAllTrades();
      all = await tradeRepo.getAllTrades();
      expect(all.isEmpty, isTrue);
    });
  });
}
