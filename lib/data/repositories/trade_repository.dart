import 'package:flutter/material.dart' show DateTimeRange;
import 'package:drift/drift.dart';

import '../database/database.dart';
import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';

class TradeRepository {
  final AppDatabase _db;

  TradeRepository(this._db);

  Stream<List<TradeModel>> watchAllTrades() {
    return (_db.select(_db.tradesTable)
          ..orderBy([(t) => OrderingTerm.desc(t.tradeDate)]))
        .watch()
        .map((rows) => rows.map(AppDatabase.tradeFromData).toList());
  }

  Future<List<TradeModel>> getAllTrades() async {
    final rows = await (_db.select(
      _db.tradesTable,
    )..orderBy([(t) => OrderingTerm.desc(t.tradeDate)])).get();
    return rows.map(AppDatabase.tradeFromData).toList();
  }

  Future<TradeModel?> getTradeById(String id) async {
    final query = _db.select(_db.tradesTable)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? AppDatabase.tradeFromData(row) : null;
  }

  Future<void> insertTrade(TradeModel trade) async {
    final companion = AppDatabase.tradeToCompanion(trade);
    await _db.into(_db.tradesTable).insertOnConflictUpdate(companion);
  }

  Future<void> updateTrade(TradeModel trade) async {
    final companion = AppDatabase.tradeToCompanion(trade);
    await (_db.update(
      _db.tradesTable,
    )..where((t) => t.id.equals(trade.id))).write(companion);
  }

  Future<void> deleteTrade(String id) async {
    await (_db.delete(_db.tradesTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deleteAllTrades() async {
    await _db.delete(_db.tradesTable).go();
  }

  Future<void> batchInsert(List<TradeModel> trades) async {
    await _db.batch((batch) {
      for (final trade in trades) {
        batch.insert(
          _db.tradesTable,
          AppDatabase.tradeToCompanion(trade),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  List<TradeModel> filterTrades(
    List<TradeModel> trades, {
    DateRangeFilter dateRange = DateRangeFilter.thisMonth,
    DateTimeRange? customRange,
    String? searchQuery,
    MarketType? market,
    String? strategy,
    TradeOutcome? outcome,
    bool? isOpen,
  }) {
    final now = DateTime.now();

    return trades.where((t) {
      // Date filter
      if (customRange != null) {
        if (t.tradeDate.isBefore(customRange.start) ||
            t.tradeDate.isAfter(customRange.end.add(const Duration(days: 1)))) {
          return false;
        }
      } else {
        switch (dateRange) {
          case DateRangeFilter.today:
            if (t.tradeDate.year != now.year ||
                t.tradeDate.month != now.month ||
                t.tradeDate.day != now.day) {
              return false;
            }
            break;
          case DateRangeFilter.thisWeek:
            final monday = now.subtract(Duration(days: now.weekday - 1));
            final startOfWeek = DateTime(monday.year, monday.month, monday.day);
            if (t.tradeDate.isBefore(startOfWeek)) return false;
            break;
          case DateRangeFilter.thisMonth:
            if (t.tradeDate.year != now.year ||
                t.tradeDate.month != now.month) {
              return false;
            }
            break;
          case DateRangeFilter.last30Days:
            if (t.tradeDate.isBefore(now.subtract(const Duration(days: 30)))) {
              return false;
            }
            break;
          case DateRangeFilter.last3Months:
            if (t.tradeDate.isBefore(now.subtract(const Duration(days: 90)))) {
              return false;
            }
            break;
          case DateRangeFilter.thisYear:
            if (t.tradeDate.year != now.year) return false;
            break;
          case DateRangeFilter.allTime:
          case DateRangeFilter.custom:
            break;
        }
      }

      // Search Query
      if (searchQuery != null && searchQuery.trim().isNotEmpty) {
        final query = searchQuery.trim().toLowerCase();
        final matchesSymbol = t.symbol.toLowerCase().contains(query);
        final matchesStrategy = t.strategy.toLowerCase().contains(query);
        final matchesNotes =
            (t.entryReason ?? '').toLowerCase().contains(query) ||
            (t.exitReason ?? '').toLowerCase().contains(query) ||
            (t.mistakes ?? '').toLowerCase().contains(query);
        if (!matchesSymbol && !matchesStrategy && !matchesNotes) return false;
      }

      // Market
      if (market != null && t.market != market) {
        return false;
      }

      // Strategy
      if (strategy != null &&
          strategy.isNotEmpty &&
          strategy != 'All' &&
          t.strategy.toLowerCase() != strategy.toLowerCase()) {
        return false;
      }

      // Outcome
      if (outcome != null && t.outcome != outcome) {
        return false;
      }

      // Status
      if (isOpen != null && t.isOpen != isOpen) {
        return false;
      }

      return true;
    }).toList();
  }
}
