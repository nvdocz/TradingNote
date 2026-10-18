import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';

part 'database.g.dart';

class TradesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get tradeDate => dateTime()();
  TextColumn get symbol => text()();
  TextColumn get market => text()();
  TextColumn get direction => text()();
  RealColumn get entryPrice => real()();
  RealColumn get exitPrice => real().nullable()();
  RealColumn get quantity => real()();
  RealColumn get contractMultiplier =>
      real().withDefault(const Constant(1.0))();
  TextColumn get strategy => text()();
  TextColumn get setup => text().nullable()();
  RealColumn get stopLoss => real().nullable()();
  RealColumn get takeProfit => real().nullable()();
  TextColumn get entryTime => text().nullable()();
  TextColumn get exitTime => text().nullable()();
  TextColumn get tradingSession => text().nullable()();
  TextColumn get timeframe => text().nullable()();
  RealColumn get brokerage => real().withDefault(const Constant(0.0))();
  RealColumn get exchangeFees => real().withDefault(const Constant(0.0))();
  RealColumn get spreadCommission => real().withDefault(const Constant(0.0))();
  RealColumn get otherCosts => real().withDefault(const Constant(0.0))();
  RealColumn get totalCosts => real().withDefault(const Constant(0.0))();
  RealColumn get grossPnL => real().withDefault(const Constant(0.0))();
  RealColumn get netPnL => real().withDefault(const Constant(0.0))();
  RealColumn get riskRewardRatio => real().nullable()();
  RealColumn get rMultiple => real().nullable()();
  TextColumn get status => text()();
  TextColumn get outcome => text()();
  TextColumn get account =>
      text().withDefault(const Constant('Main Account'))();
  TextColumn get entryReason => text().nullable()();
  TextColumn get exitReason => text().nullable()();
  TextColumn get emotionalState => text().nullable()();
  BoolColumn get ruleFollowed => boolean().withDefault(const Constant(true))();
  TextColumn get mistakes => text().nullable()();
  TextColumn get lessonsLearned => text().nullable()();
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();
  TextColumn get screenshotPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class StrategiesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get colorHex => text().withDefault(const Constant('#D4AF37'))();
  TextColumn get market => text().withDefault(const Constant('nse'))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class DailyReviewsTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get reviewDate => dateTime()();
  TextColumn get reflection => text().withDefault(const Constant(''))();
  IntColumn get disciplineScore => integer().withDefault(const Constant(5))();
  TextColumn get mistakes => text().nullable()();
  TextColumn get lessonsLearned => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettingsTable extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(
  tables: [TradesTable, StrategiesTable, DailyReviewsTable, AppSettingsTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e])
    : super(e ?? driftDatabase(name: 'tradetrack_journal'));

  @override
  int get schemaVersion => 1;

  // Conversion Helpers
  static TradeModel tradeFromData(TradesTableData row) {
    List<String> tags = [];
    try {
      final decoded = jsonDecode(row.tagsJson);
      if (decoded is List) {
        tags = decoded.map((e) => e.toString()).toList();
      }
    } catch (_) {}

    return TradeModel(
      id: row.id,
      tradeDate: row.tradeDate,
      symbol: row.symbol,
      market: MarketType.fromString(row.market),
      direction: TradeDirection.fromString(row.direction),
      entryPrice: row.entryPrice,
      exitPrice: row.exitPrice,
      quantity: row.quantity,
      contractMultiplier: row.contractMultiplier,
      strategy: row.strategy,
      setup: row.setup,
      stopLoss: row.stopLoss,
      takeProfit: row.takeProfit,
      entryTime: row.entryTime,
      exitTime: row.exitTime,
      tradingSession: row.tradingSession,
      timeframe: row.timeframe,
      brokerage: row.brokerage,
      exchangeFees: row.exchangeFees,
      spreadCommission: row.spreadCommission,
      otherCosts: row.otherCosts,
      totalCosts: row.totalCosts,
      grossPnL: row.grossPnL,
      netPnL: row.netPnL,
      riskRewardRatio: row.riskRewardRatio,
      rMultiple: row.rMultiple,
      status: TradeStatus.fromString(row.status),
      outcome: TradeOutcome.values.firstWhere(
        (e) => e.name.toLowerCase() == row.outcome.toLowerCase(),
        orElse: () => TradeOutcome.breakeven,
      ),
      account: row.account,
      entryReason: row.entryReason,
      exitReason: row.exitReason,
      emotionalState: row.emotionalState,
      ruleFollowed: row.ruleFollowed,
      mistakes: row.mistakes,
      lessonsLearned: row.lessonsLearned,
      tags: tags,
      screenshotPath: row.screenshotPath,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  static TradesTableCompanion tradeToCompanion(TradeModel trade) {
    return TradesTableCompanion(
      id: Value(trade.id),
      tradeDate: Value(trade.tradeDate),
      symbol: Value(trade.symbol),
      market: Value(trade.market.name),
      direction: Value(trade.direction.name),
      entryPrice: Value(trade.entryPrice),
      exitPrice: Value(trade.exitPrice),
      quantity: Value(trade.quantity),
      contractMultiplier: Value(trade.contractMultiplier),
      strategy: Value(trade.strategy),
      setup: Value(trade.setup),
      stopLoss: Value(trade.stopLoss),
      takeProfit: Value(trade.takeProfit),
      entryTime: Value(trade.entryTime),
      exitTime: Value(trade.exitTime),
      tradingSession: Value(trade.tradingSession),
      timeframe: Value(trade.timeframe),
      brokerage: Value(trade.brokerage),
      exchangeFees: Value(trade.exchangeFees),
      spreadCommission: Value(trade.spreadCommission),
      otherCosts: Value(trade.otherCosts),
      totalCosts: Value(trade.totalCosts),
      grossPnL: Value(trade.grossPnL),
      netPnL: Value(trade.netPnL),
      riskRewardRatio: Value(trade.riskRewardRatio),
      rMultiple: Value(trade.rMultiple),
      status: Value(trade.status.name),
      outcome: Value(trade.outcome.name),
      account: Value(trade.account),
      entryReason: Value(trade.entryReason),
      exitReason: Value(trade.exitReason),
      emotionalState: Value(trade.emotionalState),
      ruleFollowed: Value(trade.ruleFollowed),
      mistakes: Value(trade.mistakes),
      lessonsLearned: Value(trade.lessonsLearned),
      tagsJson: Value(jsonEncode(trade.tags)),
      screenshotPath: Value(trade.screenshotPath),
      createdAt: Value(trade.createdAt),
      updatedAt: Value(trade.updatedAt),
    );
  }
}
