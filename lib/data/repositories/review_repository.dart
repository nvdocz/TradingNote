import 'package:drift/drift.dart';

import '../database/database.dart';
import '../../domain/models/daily_review_model.dart';
import '../../core/utils/date_time_utils.dart';

class DailyReviewRepository {
  final AppDatabase _db;

  DailyReviewRepository(this._db);

  Stream<List<DailyReviewModel>> watchAllReviews() {
    return (_db.select(_db.dailyReviewsTable)
          ..orderBy([(r) => OrderingTerm.desc(r.reviewDate)]))
        .watch()
        .map((rows) => rows.map(_fromData).toList());
  }

  Future<DailyReviewModel?> getReviewForDate(DateTime date) async {
    final start = DateTimeUtils.startOfDay(date);
    final end = DateTimeUtils.endOfDay(date);

    final query = _db.select(_db.dailyReviewsTable)
      ..where(
        (r) =>
            r.reviewDate.isBiggerOrEqualValue(start) &
            r.reviewDate.isSmallerOrEqualValue(end),
      );
    final row = await query.getSingleOrNull();
    return row != null ? _fromData(row) : null;
  }

  Future<void> saveReview(DailyReviewModel review) async {
    final companion = DailyReviewsTableCompanion(
      id: Value(review.id),
      reviewDate: Value(DateTimeUtils.startOfDay(review.reviewDate)),
      reflection: Value(review.reflection),
      disciplineScore: Value(review.disciplineScore),
      mistakes: Value(review.mistakes),
      lessonsLearned: Value(review.lessonsLearned),
      createdAt: Value(review.createdAt),
      updatedAt: Value(review.updatedAt),
    );
    await _db.into(_db.dailyReviewsTable).insertOnConflictUpdate(companion);
  }

  static DailyReviewModel _fromData(DailyReviewsTableData row) {
    return DailyReviewModel(
      id: row.id,
      reviewDate: row.reviewDate,
      reflection: row.reflection,
      disciplineScore: row.disciplineScore,
      mistakes: row.mistakes,
      lessonsLearned: row.lessonsLearned,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}
