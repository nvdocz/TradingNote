class EquityPoint {
  final DateTime date;
  final double cumulativePnL;
  final double tradePnL;
  final String symbol;

  const EquityPoint({
    required this.date,
    required this.cumulativePnL,
    required this.tradePnL,
    required this.symbol,
  });
}

class DailyPnLPoint {
  final DateTime date;
  final double netPnL;
  final int tradeCount;
  final int winCount;
  final int lossCount;

  const DailyPnLPoint({
    required this.date,
    required this.netPnL,
    required this.tradeCount,
    required this.winCount,
    required this.lossCount,
  });

  bool get isProfitable => netPnL > 0.0001;
  bool get isLoss => netPnL < -0.0001;
  bool get isBreakeven => !isProfitable && !isLoss;
}

class FinancialSummary {
  final double netPnL;
  final double grossPnL;
  final double totalCosts;
  final int totalClosedTrades;
  final int openTradesCount;
  final int winningTrades;
  final int losingTrades;
  final int breakevenTrades;
  final double winRate; // 0 to 100
  final double lossRate; // 0 to 100
  final double breakevenRate; // 0 to 100
  final double avgWinner;
  final double avgLoser;
  final double? profitFactor; // null or undefined if no losses
  final double expectancy;
  final double maxDrawdown;
  final double maxDrawdownPercent;
  final double? avgRMultiple;
  final int longTradesCount;
  final int shortTradesCount;
  final double longNetPnL;
  final double shortNetPnL;
  final double
  returnPercentage; // Optional calculation against starting capital
  final List<EquityPoint> equityCurve;
  final List<DailyPnLPoint> dailyPnLList;

  const FinancialSummary({
    required this.netPnL,
    required this.grossPnL,
    required this.totalCosts,
    required this.totalClosedTrades,
    required this.openTradesCount,
    required this.winningTrades,
    required this.losingTrades,
    required this.breakevenTrades,
    required this.winRate,
    required this.lossRate,
    required this.breakevenRate,
    required this.avgWinner,
    required this.avgLoser,
    this.profitFactor,
    required this.expectancy,
    required this.maxDrawdown,
    required this.maxDrawdownPercent,
    this.avgRMultiple,
    required this.longTradesCount,
    required this.shortTradesCount,
    required this.longNetPnL,
    required this.shortNetPnL,
    this.returnPercentage = 0.0,
    this.equityCurve = const [],
    this.dailyPnLList = const [],
  });

  static const FinancialSummary empty = FinancialSummary(
    netPnL: 0.0,
    grossPnL: 0.0,
    totalCosts: 0.0,
    totalClosedTrades: 0,
    openTradesCount: 0,
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
