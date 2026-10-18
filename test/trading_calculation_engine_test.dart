import 'package:flutter_test/flutter_test.dart';
import 'package:tradetrack_journal/domain/engine/trading_calculation_engine.dart';
import 'package:tradetrack_journal/domain/models/trade_model.dart';
import 'package:tradetrack_journal/domain/models/trade_enums.dart';
import 'package:tradetrack_journal/domain/models/strategy_model.dart';

void main() {
  group('TradingCalculationEngine - Unit Tests', () {
    test('Long Trade Gross & Net PnL Calculation', () {
      final gross = TradingCalculationEngine.calculateGrossPnL(
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        exitPrice: 2920.0,
        quantity: 10.0,
        contractMultiplier: 1.0,
      );
      expect(gross, 700.0);

      final totalCosts = TradingCalculationEngine.calculateTotalCosts(
        brokerage: 40.0,
        exchangeFees: 10.0,
      );
      expect(totalCosts, 50.0);

      final net = TradingCalculationEngine.calculateNetPnL(
        grossPnL: gross,
        totalCosts: totalCosts,
      );
      expect(net, 650.0);

      final outcome = TradingCalculationEngine.determineOutcome(
        status: TradeStatus.closed,
        exitPrice: 2920.0,
        netPnL: net,
      );
      expect(outcome, TradeOutcome.win);
    });

    test('Short Trade Gross & Net PnL Calculation', () {
      final gross = TradingCalculationEngine.calculateGrossPnL(
        direction: TradeDirection.sell,
        entryPrice: 2920.0,
        exitPrice: 2850.0,
        quantity: 10.0,
        contractMultiplier: 1.0,
      );
      expect(gross, 700.0);

      final net = TradingCalculationEngine.calculateNetPnL(
        grossPnL: gross,
        totalCosts: 20.0,
      );
      expect(net, 680.0);
    });

    test('Losing Long Trade Calculation', () {
      final gross = TradingCalculationEngine.calculateGrossPnL(
        direction: TradeDirection.buy,
        entryPrice: 100.0,
        exitPrice: 90.0,
        quantity: 10.0,
      );
      expect(gross, -100.0);

      final net = TradingCalculationEngine.calculateNetPnL(
        grossPnL: gross,
        totalCosts: 5.0,
      );
      expect(net, -105.0);

      final outcome = TradingCalculationEngine.determineOutcome(
        status: TradeStatus.closed,
        exitPrice: 90.0,
        netPnL: net,
      );
      expect(outcome, TradeOutcome.loss);
    });

    test('Breakeven Trade Determination', () {
      final outcome = TradingCalculationEngine.determineOutcome(
        status: TradeStatus.closed,
        exitPrice: 100.0,
        netPnL: 0.005,
      );
      expect(outcome, TradeOutcome.breakeven);
    });

    test(
      'Missing Exit Price (Open Trade) Returns Zero Gross & Open Outcome',
      () {
        final gross = TradingCalculationEngine.calculateGrossPnL(
          direction: TradeDirection.buy,
          entryPrice: 2500.0,
          exitPrice: null,
          quantity: 10.0,
        );
        expect(gross, 0.0);

        final outcome = TradingCalculationEngine.determineOutcome(
          status: TradeStatus.open,
          exitPrice: null,
          netPnL: 0.0,
        );
        expect(outcome, TradeOutcome.open);
      },
    );

    test('Invalid or Zero Quantity Returns Zero Gross', () {
      final gross = TradingCalculationEngine.calculateGrossPnL(
        direction: TradeDirection.buy,
        entryPrice: 100.0,
        exitPrice: 150.0,
        quantity: 0.0,
      );
      expect(gross, 0.0);
    });

    test('Planned Risk, Reward, Risk/Reward Ratio, and R-Multiple', () {
      // Long: Entry = 2850, Stop Loss = 2800, Take Profit = 2950, Qty = 10
      final risk = TradingCalculationEngine.calculatePlannedRisk(
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        stopLoss: 2800.0,
        quantity: 10.0,
      );
      expect(risk, 500.0);

      final reward = TradingCalculationEngine.calculatePlannedReward(
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        takeProfit: 2950.0,
        quantity: 10.0,
      );
      expect(reward, 1000.0);

      final rrRatio = TradingCalculationEngine.calculateRiskRewardRatio(
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        stopLoss: 2800.0,
        takeProfit: 2950.0,
        quantity: 10.0,
      );
      expect(rrRatio, 2.0);

      final rMultiple = TradingCalculationEngine.calculateRMultiple(
        netPnL: 1050.0,
        direction: TradeDirection.buy,
        entryPrice: 2850.0,
        stopLoss: 2800.0,
        quantity: 10.0,
      );
      expect(rMultiple, 2.1);
    });

    test('Zero or Negative Planned Risk returns null for R-Multiple', () {
      // Long with Stop Loss above Entry Price is invalid risk
      final rMultiple = TradingCalculationEngine.calculateRMultiple(
        netPnL: 500.0,
        direction: TradeDirection.buy,
        entryPrice: 100.0,
        stopLoss: 120.0,
        quantity: 10.0,
      );
      expect(rMultiple, isNull);
    });

    test(
      'FinancialSummary Aggregation, Win-Rate, Expectancy, and Drawdown',
      () {
        final now = DateTime(2025, 1, 15);
        final trades = [
          TradeModel(
            id: '1',
            tradeDate: now.subtract(const Duration(days: 3)),
            symbol: 'RELIANCE',
            market: MarketType.nse,
            direction: TradeDirection.buy,
            entryPrice: 100.0,
            exitPrice: 120.0,
            quantity: 10.0,
            strategy: 'Breakout',
            totalCosts: 10.0,
            grossPnL: 200.0,
            netPnL: 190.0,
            status: TradeStatus.closed,
            outcome: TradeOutcome.win,
            createdAt: now,
            updatedAt: now,
          ),
          TradeModel(
            id: '2',
            tradeDate: now.subtract(const Duration(days: 2)),
            symbol: 'TCS',
            market: MarketType.nse,
            direction: TradeDirection.buy,
            entryPrice: 100.0,
            exitPrice: 90.0,
            quantity: 10.0,
            strategy: 'Breakout',
            totalCosts: 10.0,
            grossPnL: -100.0,
            netPnL: -110.0,
            status: TradeStatus.closed,
            outcome: TradeOutcome.loss,
            createdAt: now,
            updatedAt: now,
          ),
          TradeModel(
            id: '3',
            tradeDate: now.subtract(const Duration(days: 1)),
            symbol: 'INFY',
            market: MarketType.nse,
            direction: TradeDirection.sell,
            entryPrice: 100.0,
            exitPrice: 80.0,
            quantity: 5.0,
            strategy: 'Pullback',
            totalCosts: 10.0,
            grossPnL: 100.0,
            netPnL: 90.0,
            status: TradeStatus.closed,
            outcome: TradeOutcome.win,
            createdAt: now,
            updatedAt: now,
          ),
          // Open trade (should be excluded from realized summary)
          TradeModel(
            id: '4',
            tradeDate: now,
            symbol: 'HDFCBANK',
            market: MarketType.nse,
            direction: TradeDirection.buy,
            entryPrice: 1000.0,
            exitPrice: null,
            quantity: 10.0,
            strategy: 'Breakout',
            totalCosts: 0.0,
            grossPnL: 0.0,
            netPnL: 0.0,
            status: TradeStatus.open,
            outcome: TradeOutcome.open,
            createdAt: now,
            updatedAt: now,
          ),
        ];

        final summary = TradingCalculationEngine.calculateSummary(
          trades,
          startingCapital: 100000.0,
        );

        expect(summary.totalClosedTrades, 3);
        expect(summary.openTradesCount, 1);
        expect(summary.winningTrades, 2);
        expect(summary.losingTrades, 1);
        // Net PnL = 190 - 110 + 90 = 170
        expect(summary.netPnL, 170.0);
        // Win Rate = 2 / 3 * 100 = 66.67%
        expect(summary.winRate, 66.67);
        // Expectancy = 170 / 3 = 56.67
        expect(summary.expectancy, 56.67);
        // Profit factor = Gross Profits (200 + 100 = 300) / Absolute Gross Losses (100) = 3.0
        expect(summary.profitFactor, 3.0);
        // Drawdown: after trade 1 equity=190 (peak=190). Trade 2 drops to 80 (drawdown=110). Trade 3 rises to 170.
        expect(summary.maxDrawdown, 110.0);
      },
    );

    test('Profit Factor Edge Case: No Losses Returns Null (Undefined)', () {
      final trades = [
        TradeModel(
          id: '1',
          tradeDate: DateTime.now(),
          symbol: 'RELIANCE',
          market: MarketType.nse,
          direction: TradeDirection.buy,
          entryPrice: 100.0,
          exitPrice: 120.0,
          quantity: 10.0,
          strategy: 'Breakout',
          totalCosts: 0.0,
          grossPnL: 200.0,
          netPnL: 200.0,
          status: TradeStatus.closed,
          outcome: TradeOutcome.win,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final summary = TradingCalculationEngine.calculateSummary(trades);
      expect(summary.profitFactor, isNull);
    });

    test('Strategy Statistics Calculation', () {
      final strategy = StrategyModel(
        id: 's1',
        name: 'Breakout',
        createdAt: DateTime.now(),
      );

      final trades = [
        TradeModel(
          id: '1',
          tradeDate: DateTime.now(),
          symbol: 'RELIANCE',
          market: MarketType.nse,
          direction: TradeDirection.buy,
          entryPrice: 100.0,
          exitPrice: 120.0,
          quantity: 10.0,
          strategy: 'Breakout',
          totalCosts: 0.0,
          grossPnL: 200.0,
          netPnL: 200.0,
          status: TradeStatus.closed,
          outcome: TradeOutcome.win,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final stats = TradingCalculationEngine.calculateStrategyStats(
        strategy,
        trades,
      );
      expect(stats.totalTrades, 1);
      expect(stats.winRate, 100.0);
      expect(stats.isSampleSizeSmall, isTrue);
    });
  });
}
