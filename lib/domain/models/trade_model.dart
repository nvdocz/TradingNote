import 'trade_enums.dart';

class TradeModel {
  final String id;
  final DateTime tradeDate;
  final String symbol;
  final MarketType market;
  final TradeDirection direction;
  final double entryPrice;
  final double? exitPrice;
  final double quantity;
  final double contractMultiplier;
  final String strategy;
  final String? setup;
  final double? stopLoss;
  final double? takeProfit;
  final String? entryTime;
  final String? exitTime;
  final String? tradingSession;
  final String? timeframe;
  final double brokerage;
  final double exchangeFees;
  final double spreadCommission;
  final double otherCosts;
  final double totalCosts;
  final double grossPnL;
  final double netPnL;
  final double? riskRewardRatio;
  final double? rMultiple;
  final TradeStatus status;
  final TradeOutcome outcome;
  final String account;
  final String? entryReason;
  final String? exitReason;
  final String? emotionalState;
  final bool ruleFollowed;
  final String? mistakes;
  final String? lessonsLearned;
  final List<String> tags;
  final String? screenshotPath;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TradeModel({
    required this.id,
    required this.tradeDate,
    required this.symbol,
    required this.market,
    required this.direction,
    required this.entryPrice,
    this.exitPrice,
    required this.quantity,
    this.contractMultiplier = 1.0,
    required this.strategy,
    this.setup,
    this.stopLoss,
    this.takeProfit,
    this.entryTime,
    this.exitTime,
    this.tradingSession,
    this.timeframe,
    this.brokerage = 0.0,
    this.exchangeFees = 0.0,
    this.spreadCommission = 0.0,
    this.otherCosts = 0.0,
    required this.totalCosts,
    required this.grossPnL,
    required this.netPnL,
    this.riskRewardRatio,
    this.rMultiple,
    required this.status,
    required this.outcome,
    this.account = 'Main Account',
    this.entryReason,
    this.exitReason,
    this.emotionalState,
    this.ruleFollowed = true,
    this.mistakes,
    this.lessonsLearned,
    this.tags = const [],
    this.screenshotPath,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isOpen => status == TradeStatus.open;
  bool get isClosed => status == TradeStatus.closed;
  bool get isWin => outcome == TradeOutcome.win;
  bool get isLoss => outcome == TradeOutcome.loss;
  bool get isBreakeven => outcome == TradeOutcome.breakeven;

  TradeModel copyWith({
    String? id,
    DateTime? tradeDate,
    String? symbol,
    MarketType? market,
    TradeDirection? direction,
    double? entryPrice,
    double? exitPrice,
    double? quantity,
    double? contractMultiplier,
    String? strategy,
    String? setup,
    double? stopLoss,
    double? takeProfit,
    String? entryTime,
    String? exitTime,
    String? tradingSession,
    String? timeframe,
    double? brokerage,
    double? exchangeFees,
    double? spreadCommission,
    double? otherCosts,
    double? totalCosts,
    double? grossPnL,
    double? netPnL,
    double? riskRewardRatio,
    double? rMultiple,
    TradeStatus? status,
    TradeOutcome? outcome,
    String? account,
    String? entryReason,
    String? exitReason,
    String? emotionalState,
    bool? ruleFollowed,
    String? mistakes,
    String? lessonsLearned,
    List<String>? tags,
    String? screenshotPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TradeModel(
      id: id ?? this.id,
      tradeDate: tradeDate ?? this.tradeDate,
      symbol: symbol ?? this.symbol,
      market: market ?? this.market,
      direction: direction ?? this.direction,
      entryPrice: entryPrice ?? this.entryPrice,
      exitPrice: exitPrice ?? this.exitPrice,
      quantity: quantity ?? this.quantity,
      contractMultiplier: contractMultiplier ?? this.contractMultiplier,
      strategy: strategy ?? this.strategy,
      setup: setup ?? this.setup,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      tradingSession: tradingSession ?? this.tradingSession,
      timeframe: timeframe ?? this.timeframe,
      brokerage: brokerage ?? this.brokerage,
      exchangeFees: exchangeFees ?? this.exchangeFees,
      spreadCommission: spreadCommission ?? this.spreadCommission,
      otherCosts: otherCosts ?? this.otherCosts,
      totalCosts: totalCosts ?? this.totalCosts,
      grossPnL: grossPnL ?? this.grossPnL,
      netPnL: netPnL ?? this.netPnL,
      riskRewardRatio: riskRewardRatio ?? this.riskRewardRatio,
      rMultiple: rMultiple ?? this.rMultiple,
      status: status ?? this.status,
      outcome: outcome ?? this.outcome,
      account: account ?? this.account,
      entryReason: entryReason ?? this.entryReason,
      exitReason: exitReason ?? this.exitReason,
      emotionalState: emotionalState ?? this.emotionalState,
      ruleFollowed: ruleFollowed ?? this.ruleFollowed,
      mistakes: mistakes ?? this.mistakes,
      lessonsLearned: lessonsLearned ?? this.lessonsLearned,
      tags: tags ?? this.tags,
      screenshotPath: screenshotPath ?? this.screenshotPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tradeDate': tradeDate.toIso8601String(),
      'symbol': symbol,
      'market': market.name,
      'direction': direction.name,
      'entryPrice': entryPrice,
      'exitPrice': exitPrice,
      'quantity': quantity,
      'contractMultiplier': contractMultiplier,
      'strategy': strategy,
      'setup': setup,
      'stopLoss': stopLoss,
      'takeProfit': takeProfit,
      'entryTime': entryTime,
      'exitTime': exitTime,
      'tradingSession': tradingSession,
      'timeframe': timeframe,
      'brokerage': brokerage,
      'exchangeFees': exchangeFees,
      'spreadCommission': spreadCommission,
      'otherCosts': otherCosts,
      'totalCosts': totalCosts,
      'grossPnL': grossPnL,
      'netPnL': netPnL,
      'riskRewardRatio': riskRewardRatio,
      'rMultiple': rMultiple,
      'status': status.name,
      'outcome': outcome.name,
      'account': account,
      'entryReason': entryReason,
      'exitReason': exitReason,
      'emotionalState': emotionalState,
      'ruleFollowed': ruleFollowed,
      'mistakes': mistakes,
      'lessonsLearned': lessonsLearned,
      'tags': tags,
      'screenshotPath': screenshotPath,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      id: json['id'] as String,
      tradeDate: DateTime.parse(json['tradeDate'] as String),
      symbol: json['symbol'] as String,
      market: MarketType.fromString(json['market'] as String),
      direction: TradeDirection.fromString(json['direction'] as String),
      entryPrice: (json['entryPrice'] as num).toDouble(),
      exitPrice: json['exitPrice'] != null
          ? (json['exitPrice'] as num).toDouble()
          : null,
      quantity: (json['quantity'] as num).toDouble(),
      contractMultiplier:
          (json['contractMultiplier'] as num?)?.toDouble() ?? 1.0,
      strategy: json['strategy'] as String,
      setup: json['setup'] as String?,
      stopLoss: json['stopLoss'] != null
          ? (json['stopLoss'] as num).toDouble()
          : null,
      takeProfit: json['takeProfit'] != null
          ? (json['takeProfit'] as num).toDouble()
          : null,
      entryTime: json['entryTime'] as String?,
      exitTime: json['exitTime'] as String?,
      tradingSession: json['tradingSession'] as String?,
      timeframe: json['timeframe'] as String?,
      brokerage: (json['brokerage'] as num?)?.toDouble() ?? 0.0,
      exchangeFees: (json['exchangeFees'] as num?)?.toDouble() ?? 0.0,
      spreadCommission: (json['spreadCommission'] as num?)?.toDouble() ?? 0.0,
      otherCosts: (json['otherCosts'] as num?)?.toDouble() ?? 0.0,
      totalCosts: (json['totalCosts'] as num?)?.toDouble() ?? 0.0,
      grossPnL: (json['grossPnL'] as num?)?.toDouble() ?? 0.0,
      netPnL: (json['netPnL'] as num?)?.toDouble() ?? 0.0,
      riskRewardRatio: json['riskRewardRatio'] != null
          ? (json['riskRewardRatio'] as num).toDouble()
          : null,
      rMultiple: json['rMultiple'] != null
          ? (json['rMultiple'] as num).toDouble()
          : null,
      status: TradeStatus.fromString(json['status'] as String),
      outcome: TradeOutcome.values.firstWhere(
        (e) =>
            e.name.toLowerCase() == (json['outcome'] as String).toLowerCase(),
        orElse: () => TradeOutcome.breakeven,
      ),
      account: json['account'] as String? ?? 'Main Account',
      entryReason: json['entryReason'] as String?,
      exitReason: json['exitReason'] as String?,
      emotionalState: json['emotionalState'] as String?,
      ruleFollowed: json['ruleFollowed'] as bool? ?? true,
      mistakes: json['mistakes'] as String?,
      lessonsLearned: json['lessonsLearned'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          const [],
      screenshotPath: json['screenshotPath'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : DateTime.now(),
    );
  }
}
