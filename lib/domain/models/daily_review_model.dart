class DailyReviewModel {
  final String id;
  final DateTime reviewDate;
  final String reflection;
  final int disciplineScore; // 1-5
  final String? mistakes;
  final String? lessonsLearned;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DailyReviewModel({
    required this.id,
    required this.reviewDate,
    this.reflection = '',
    this.disciplineScore = 5,
    this.mistakes,
    this.lessonsLearned,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewDate': reviewDate.toIso8601String(),
      'reflection': reflection,
      'disciplineScore': disciplineScore,
      'mistakes': mistakes,
      'lessonsLearned': lessonsLearned,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory DailyReviewModel.fromJson(Map<String, dynamic> json) {
    return DailyReviewModel(
      id: json['id'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      reflection: json['reflection'] as String? ?? '',
      disciplineScore: (json['disciplineScore'] as num?)?.toInt() ?? 5,
      mistakes: json['mistakes'] as String?,
      lessonsLearned: json['lessonsLearned'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : DateTime.now(),
    );
  }

  DailyReviewModel copyWith({
    String? id,
    DateTime? reviewDate,
    String? reflection,
    int? disciplineScore,
    String? mistakes,
    String? lessonsLearned,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyReviewModel(
      id: id ?? this.id,
      reviewDate: reviewDate ?? this.reviewDate,
      reflection: reflection ?? this.reflection,
      disciplineScore: disciplineScore ?? this.disciplineScore,
      mistakes: mistakes ?? this.mistakes,
      lessonsLearned: lessonsLearned ?? this.lessonsLearned,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
