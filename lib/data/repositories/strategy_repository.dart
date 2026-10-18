import 'package:drift/drift.dart';

import '../database/database.dart';
import '../../domain/models/strategy_model.dart';
import '../../domain/models/trade_enums.dart';

class StrategyRepository {
  final AppDatabase _db;

  StrategyRepository(this._db);

  Stream<List<StrategyModel>> watchAllStrategies() {
    return (_db.select(_db.strategiesTable)
          ..where((s) => s.isArchived.equals(false))
          ..orderBy([(s) => OrderingTerm.asc(s.name)]))
        .watch()
        .map((rows) => rows.map(_fromData).toList());
  }

  Future<List<StrategyModel>> getAllStrategies() async {
    final rows =
        await (_db.select(_db.strategiesTable)
              ..where((s) => s.isArchived.equals(false))
              ..orderBy([(s) => OrderingTerm.asc(s.name)]))
            .get();
    return rows.map(_fromData).toList();
  }

  Future<void> insertStrategy(StrategyModel strategy) async {
    await _db
        .into(_db.strategiesTable)
        .insertOnConflictUpdate(
          StrategiesTableCompanion(
            id: Value(strategy.id),
            name: Value(strategy.name),
            description: Value(strategy.description),
            colorHex: Value(strategy.colorHex),
            market: Value(strategy.market.name),
            isArchived: Value(strategy.isArchived),
            createdAt: Value(strategy.createdAt),
          ),
        );
  }

  Future<void> updateStrategy(StrategyModel strategy) async {
    await (_db.update(
      _db.strategiesTable,
    )..where((s) => s.id.equals(strategy.id))).write(
      StrategiesTableCompanion(
        name: Value(strategy.name),
        description: Value(strategy.description),
        colorHex: Value(strategy.colorHex),
        market: Value(strategy.market.name),
        isArchived: Value(strategy.isArchived),
      ),
    );
  }

  Future<void> archiveStrategy(String id) async {
    await (_db.update(_db.strategiesTable)..where((s) => s.id.equals(id)))
        .write(const StrategiesTableCompanion(isArchived: Value(true)));
  }

  Future<void> deleteStrategy(String id) async {
    await (_db.delete(_db.strategiesTable)..where((s) => s.id.equals(id))).go();
  }

  static StrategyModel _fromData(StrategiesTableData row) {
    return StrategyModel(
      id: row.id,
      name: row.name,
      description: row.description,
      colorHex: row.colorHex,
      market: MarketType.fromString(row.market),
      isArchived: row.isArchived,
      createdAt: row.createdAt,
    );
  }
}
