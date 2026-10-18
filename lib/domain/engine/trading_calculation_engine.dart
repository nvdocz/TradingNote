import 'dart:math' as math;

import '../models/trade_model.dart';
import '../models/trade_enums.dart';
import '../models/financial_summary.dart';
import '../models/strategy_model.dart';

class TradingCalculationEngine {
  static const double breakevenThreshold = 0.01;

  /// Calculates Gross P&L for a trade given direction, prices, quantity, and contract multiplier.
  static double calculateGrossPnL({
    required TradeDirection direction,
    required double entryPrice,
    required double? exitPrice,
    required double quantity,
    double contractMultiplier = 1.0,
  }) {
    if (exitPrice == null) return 0.0;
    if (quantity <= 0) return 0.0;

    double pnlPerUnit;
    if (direction == TradeDirection.buy) {
      pnlPerUnit = exitPrice - entryPrice;
    } else {
      pnlPerUnit = entryPrice - exitPrice;
    }

    final gross = pnlPerUnit * quantity * contractMultiplier;
    return _roundFinancial(gross);
  }

  /// Calculates Net P&L given gross P&L and total costs.
  static double calculateNetPnL({
    required double grossPnL,
    required double totalCosts,
  }) {
    return _roundFinancial(grossPnL - totalCosts);
  }

  /// Calculates total trading costs.
  static double calculateTotalCosts({
    double brokerage = 0.0,
    double exchangeFees = 0.0,
    double spreadCommission = 0.0,
    double otherCosts = 0.0,
  }) {
    return _roundFinancial(
      brokerage + exchangeFees + spreadCommission + otherCosts,
    );
  }

  /// Calculates initial planned monetary risk based on entry price and stop loss.
  static double? calculatePlannedRisk({
    required TradeDirection direction,
    required double entryPrice,
    required double? stopLoss,
    required double quantity,
    double contractMultiplier = 1.0,
  }) {
    if (stopLoss == null || quantity <= 0) return null;

    double priceRisk;
    if (direction == TradeDirection.buy) {
      priceRisk = entryPrice - stopLoss;
    } else {
      priceRisk = stopLoss - entryPrice;
    }

    if (priceRisk <= 0) return null;
    return _roundFinancial(priceRisk * quantity * contractMultiplier);
  }

  /// Calculates initial planned monetary reward based on entry price and take profit.
  static double? calculatePlannedReward({
    required TradeDirection direction,
    required double entryPrice,
    required double? takeProfit,
    required double quantity,
    double contractMultiplier = 1.0,
  }) {
    if (takeProfit == null || quantity <= 0) return null;

    double priceReward;
    if (direction == TradeDirection.buy) {
      priceReward = takeProfit - entryPrice;
    } else {
      priceReward = entryPrice - takeProfit;
    }

    if (priceReward <= 0) return null;
    return _roundFinancial(priceReward * quantity * contractMultiplier);
  }

  /// Calculates Risk to Reward ratio (Reward / Risk).
  static double? calculateRiskRewardRatio({
    required TradeDirection direction,
    required double entryPrice,
    required double? stopLoss,
    required double? takeProfit,
    required double quantity,
    double contractMultiplier = 1.0,
  }) {
    final risk = calculatePlannedRisk(
      direction: direction,
      entryPrice: entryPrice,
      stopLoss: stopLoss,
      quantity: quantity,
      contractMultiplier: contractMultiplier,
    );
    final reward = calculatePlannedReward(
      direction: direction,
      entryPrice: entryPrice,
      takeProfit: takeProfit,
      quantity: quantity,
      contractMultiplier: contractMultiplier,
    );

    if (risk == null || reward == null || risk <= 0) return null;
    return _roundFinancial(reward / risk);
  }

  /// Calculates R-Multiple (Net P&L / Initial Planned Monetary Risk).
  static double? calculateRMultiple({
    required double netPnL,
    required TradeDirection direction,
    required double entryPrice,
    required double? stopLoss,
    required double quantity,
    double contractMultiplier = 1.0,
  }) {
    final risk = calculatePlannedRisk(
      direction: direction,
      entryPrice: entryPrice,
      stopLoss: stopLoss,
      quantity: quantity,
      contractMultiplier: contractMultiplier,
    );

    if (risk == null || risk <= 0) return null;
    return _roundFinancial(netPnL / risk);
  }

  /// Determines trade outcome (Win, Loss, Breakeven, Open).
  static TradeOutcome determineOutcome({
    required TradeStatus status,
    required double? exitPrice,
    required double netPnL,
  }) {
    if (status == TradeStatus.open || exitPrice == null) {
      return TradeOutcome.open;
    }

    if (netPnL > breakevenThreshold) {
      return TradeOutcome.win;
    } else if (netPnL < -breakevenThreshold) {
      return TradeOutcome.loss;
    } else {
      return TradeOutcome.breakeven;
    }
  }

  /// Aggregates a list of trades into a comprehensive FinancialSummary.
  static FinancialSummary calculateSummary(
    List<TradeModel> trades, {
    double startingCapital = 100000.0,
  }) {
    if (trades.isEmpty) {
      return FinancialSummary.empty;
    }

    final closedTrades = trades
        .where((t) => t.isClosed && t.exitPrice != null)
        .toList();
    final openTrades = trades
        .where((t) => t.isOpen || t.exitPrice == null)
        .toList();

    if (closedTrades.isEmpty) {
      return FinancialSummary(
        netPnL: 0.0,
        grossPnL: 0.0,
        totalCosts: 0.0,
        totalClosedTrades: 0,
        openTradesCount: openTrades.length,
        winningTrades: 0,
        losingTrades: 0,
        breakevenTrades: 0,
        winRate: 0.0,
        lossRate: 0.0,
        breakevenRate: 0.0,
        avgWinner: 0.0,
        avgLoser: 0.0,
        profitFactor: null,
        expectancy: 0.0,
        maxDrawdown: 0.0,
        maxDrawdownPercent: 0.0,
        avgRMultiple: null,
        longTradesCount: 0,
        shortTradesCount: 0,
        longNetPnL: 0.0,
        shortNetPnL: 0.0,
        returnPercentage: 0.0,
        equityCurve: [],
        dailyPnLList: [],
      );
    }

    // Sort chronologically for equity curve and drawdown
    closedTrades.sort((a, b) => a.tradeDate.compareTo(b.tradeDate));

    double totalNetPnL = 0.0;
    double totalGrossPnL = 0.0;
    double totalCosts = 0.0;

    int winningTrades = 0;
    int losingTrades = 0;
    int breakevenTrades = 0;

    double sumWinningNetPnL = 0.0;
    double sumLosingNetPnL = 0.0;
    double grossProfits = 0.0;
    double grossLosses = 0.0;

    int longTradesCount = 0;
    int shortTradesCount = 0;
    double longNetPnL = 0.0;
    double shortNetPnL = 0.0;

    double sumRMultiples = 0.0;
    int validRMultipleCount = 0;

    final List<EquityPoint> equityCurve = [];
    final Map<DateTime, _DailyAccumulator> dailyMap = {};

    double runningCumulativePnL = 0.0;
    double peakEquity = 0.0;
    double maxDrawdown = 0.0;

    for (final trade in closedTrades) {
      final net = trade.netPnL;
      final gross = trade.grossPnL;

      totalNetPnL += net;
      totalGrossPnL += gross;
      totalCosts += trade.totalCosts;

      if (net > breakevenThreshold) {
        winningTrades++;
        sumWinningNetPnL += net;
        grossProfits += math.max(0.0, gross);
      } else if (net < -breakevenThreshold) {
        losingTrades++;
        sumLosingNetPnL += net.abs();
        grossLosses += gross < 0 ? gross.abs() : 0.0;
      } else {
        breakevenTrades++;
      }

      if (trade.direction == TradeDirection.buy) {
        longTradesCount++;
        longNetPnL += net;
      } else {
        shortTradesCount++;
        shortNetPnL += net;
      }

      if (trade.rMultiple != null &&
          !trade.rMultiple!.isNaN &&
          !trade.rMultiple!.isInfinite) {
        sumRMultiples += trade.rMultiple!;
        validRMultipleCount++;
      }

      runningCumulativePnL += net;
      equityCurve.add(
        EquityPoint(
          date: trade.tradeDate,
          cumulativePnL: _roundFinancial(runningCumulativePnL),
          tradePnL: net,
          symbol: trade.symbol,
        ),
      );

      // Drawdown calculation: peak vs trough
      if (runningCumulativePnL > peakEquity) {
        peakEquity = runningCumulativePnL;
      }
      final currentDrawdown = peakEquity - runningCumulativePnL;
      if (currentDrawdown > maxDrawdown) {
        maxDrawdown = currentDrawdown;
      }

      // Daily grouping
      final dayKey = DateTime(
        trade.tradeDate.year,
        trade.tradeDate.month,
        trade.tradeDate.day,
      );
      dailyMap.putIfAbsent(dayKey, () => _DailyAccumulator(dayKey));
      final dayAcc = dailyMap[dayKey]!;
      dayAcc.addTrade(net);
    }

    final totalClosed = closedTrades.length;
    final winRate = totalClosed > 0 ? (winningTrades / totalClosed) * 100 : 0.0;
    final lossRate = totalClosed > 0 ? (losingTrades / totalClosed) * 100 : 0.0;
    final breakevenRate = totalClosed > 0
        ? (breakevenTrades / totalClosed) * 100
        : 0.0;

    final avgWinner = winningTrades > 0
        ? sumWinningNetPnL / winningTrades
        : 0.0;
    final avgLoser = losingTrades > 0 ? sumLosingNetPnL / losingTrades : 0.0;

    // Profit factor = Gross Profits / Absolute Gross Losses
    // If no losses, profit factor is undefined (null)
    final double? profitFactor = grossLosses > 0.0001
        ? _roundFinancial(grossProfits / grossLosses)
        : (grossProfits > 0 ? null : 0.0);

    final expectancy = totalClosed > 0 ? totalNetPnL / totalClosed : 0.0;

    final double? avgRMultiple = validRMultipleCount > 0
        ? _roundFinancial(sumRMultiples / validRMultipleCount)
        : null;

    final maxDrawdownPercent = startingCapital > 0
        ? _roundFinancial((maxDrawdown / startingCapital) * 100)
        : 0.0;

    final returnPercent = startingCapital > 0
        ? _roundFinancial((totalNetPnL / startingCapital) * 100)
        : 0.0;

    final dailyPnLList = dailyMap.values.map((e) => e.toDailyPoint()).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return FinancialSummary(
      netPnL: _roundFinancial(totalNetPnL),
      grossPnL: _roundFinancial(totalGrossPnL),
      totalCosts: _roundFinancial(totalCosts),
      totalClosedTrades: totalClosed,
      openTradesCount: openTrades.length,
      winningTrades: winningTrades,
      losingTrades: losingTrades,
      breakevenTrades: breakevenTrades,
      winRate: _roundFinancial(winRate),
      lossRate: _roundFinancial(lossRate),
      breakevenRate: _roundFinancial(breakevenRate),
      avgWinner: _roundFinancial(avgWinner),
      avgLoser: _roundFinancial(avgLoser),
      profitFactor: profitFactor,
      expectancy: _roundFinancial(expectancy),
      maxDrawdown: _roundFinancial(maxDrawdown),
      maxDrawdownPercent: maxDrawdownPercent,
      avgRMultiple: avgRMultiple,
      longTradesCount: longTradesCount,
      shortTradesCount: shortTradesCount,
      longNetPnL: _roundFinancial(longNetPnL),
      shortNetPnL: _roundFinancial(shortNetPnL),
      returnPercentage: returnPercent,
      equityCurve: equityCurve,
      dailyPnLList: dailyPnLList,
    );
  }

  /// Calculates statistics for a single strategy.
  static StrategyStats calculateStrategyStats(
    StrategyModel strategy,
    List<TradeModel> allTrades,
  ) {
    final strategyTrades = allTrades
        .where(
          (t) =>
              t.strategy.trim().toLowerCase() ==
              strategy.name.trim().toLowerCase(),
        )
        .toList();

    final closedTrades = strategyTrades.where((t) => t.isClosed).toList();

    int winningTrades = 0;
    int losingTrades = 0;
    int breakevenTrades = 0;
    double netPnL = 0.0;
    double sumWinners = 0.0;
    double sumLosers = 0.0;
    double grossProfits = 0.0;
    double grossLosses = 0.0;
    double sumR = 0.0;
    int countR = 0;
    int rulesFollowedCount = 0;

    for (final t in closedTrades) {
      netPnL += t.netPnL;
      if (t.netPnL > breakevenThreshold) {
        winningTrades++;
        sumWinners += t.netPnL;
        grossProfits += math.max(0.0, t.grossPnL);
      } else if (t.netPnL < -breakevenThreshold) {
        losingTrades++;
        sumLosers += t.netPnL.abs();
        grossLosses += t.grossPnL < 0 ? t.grossPnL.abs() : 0.0;
      } else {
        breakevenTrades++;
      }

      if (t.rMultiple != null &&
          !t.rMultiple!.isNaN &&
          !t.rMultiple!.isInfinite) {
        sumR += t.rMultiple!;
        countR++;
      }

      if (t.ruleFollowed) {
        rulesFollowedCount++;
      }
    }

    final total = closedTrades.length;
    final winRate = total > 0 ? (winningTrades / total) * 100 : 0.0;
    final avgWinner = winningTrades > 0 ? sumWinners / winningTrades : 0.0;
    final avgLoser = losingTrades > 0 ? sumLosers / losingTrades : 0.0;
    final double? profitFactor = grossLosses > 0.0001
        ? _roundFinancial(grossProfits / grossLosses)
        : (grossProfits > 0 ? null : 0.0);
    final expectancy = total > 0 ? netPnL / total : 0.0;
    final double? avgR = countR > 0 ? _roundFinancial(sumR / countR) : null;
    final ruleAdherence = total > 0
        ? (rulesFollowedCount / total) * 100
        : 100.0;

    return StrategyStats(
      strategy: strategy,
      totalTrades: total,
      winningTrades: winningTrades,
      losingTrades: losingTrades,
      breakevenTrades: breakevenTrades,
      netPnL: _roundFinancial(netPnL),
      winRate: _roundFinancial(winRate),
      avgWinner: _roundFinancial(avgWinner),
      avgLoser: _roundFinancial(avgLoser),
      profitFactor: profitFactor,
      expectancy: _roundFinancial(expectancy),
      avgRMultiple: avgR,
      ruleAdherencePercent: _roundFinancial(ruleAdherence),
      isSampleSizeSmall: total < 10,
    );
  }

  static double _roundFinancial(double val) {
    if (val.isNaN || val.isInfinite) return 0.0;
    return (val * 100).roundToDouble() / 100;
  }
}

class _DailyAccumulator {
  final DateTime date;
  double netPnL = 0.0;
  int tradeCount = 0;
  int winCount = 0;
  int lossCount = 0;

  _DailyAccumulator(this.date);

  void addTrade(double pnl) {
    tradeCount++;
    netPnL += pnl;
    if (pnl > TradingCalculationEngine.breakevenThreshold) {
      winCount++;
    } else if (pnl < -TradingCalculationEngine.breakevenThreshold) {
      lossCount++;
    }
  }

  DailyPnLPoint toDailyPoint() {
    return DailyPnLPoint(
      date: date,
      netPnL: (netPnL * 100).roundToDouble() / 100,
      tradeCount: tradeCount,
      winCount: winCount,
      lossCount: lossCount,
    );
  }
}
