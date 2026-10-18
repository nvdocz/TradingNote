import 'trade_enums.dart';

class StrategyModel {
  final String id;
  final String name;
  final String? description;
  final String colorHex;
  final MarketType market;
  final bool isArchived;
  final DateTime createdAt;

  const StrategyModel({
    required this.id,
    required this.name,
    this.description,
    this.colorHex = '#D4AF37',
    this.market = MarketType.nse,
    this.isArchived = false,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'colorHex': colorHex,
      'market': market.name,
      'isArchived': isArchived,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory StrategyModel.fromJson(Map<String, dynamic> json) {
    return StrategyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      colorHex: json['colorHex'] as String? ?? '#D4AF37',
      market: MarketType.fromString(json['market'] as String? ?? 'nse'),
      isArchived: json['isArchived'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }
}

class StrategyStats {
  final StrategyModel strategy;
  final int totalTrades;
  final int winningTrades;
  final int losingTrades;
  final int breakevenTrades;
  final double netPnL;
  final double winRate; // 0 to 100
  final double avgWinner;
  final double avgLoser;
  final double? profitFactor;
  final double expectancy;
  final double? avgRMultiple;
  final double ruleAdherencePercent;
  final bool isSampleSizeSmall; // Less than 10 trades

  const StrategyStats({
    required this.strategy,
    required this.totalTrades,
    required this.winningTrades,
    required this.losingTrades,
    required this.breakevenTrades,
    required this.netPnL,
    required this.winRate,
    required this.avgWinner,
    required this.avgLoser,
    this.profitFactor,
    required this.expectancy,
    this.avgRMultiple,
    required this.ruleAdherencePercent,
    required this.isSampleSizeSmall,
  });
}
