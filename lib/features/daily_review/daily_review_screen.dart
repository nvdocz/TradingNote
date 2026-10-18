import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_time_utils.dart';
import '../../domain/engine/trading_calculation_engine.dart';
import '../../domain/models/daily_review_model.dart';
import '../../shared/widgets/app_dialogs.dart';
import '../../shared/widgets/gold_button.dart';

class DailyReviewScreen extends ConsumerStatefulWidget {
  const DailyReviewScreen({super.key});

  @override
  ConsumerState<DailyReviewScreen> createState() => _DailyReviewScreenState();
}

class _DailyReviewScreenState extends ConsumerState<DailyReviewScreen> {
  late DateTime _selectedMonth;
  late DateTime _selectedDay;
  final TextEditingController _reflectionController = TextEditingController();
  final TextEditingController _mistakesController = TextEditingController();
  final TextEditingController _lessonsController = TextEditingController();
  int _disciplineScore = 5;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedMonth = DateTime(now.year, now.month, 1);
    _selectedDay = DateTime(now.year, now.month, now.day);
    _loadReviewForDay(_selectedDay);
  }

  @override
  void dispose() {
    _reflectionController.dispose();
    _mistakesController.dispose();
    _lessonsController.dispose();
    super.dispose();
  }

  void _loadReviewForDay(DateTime day) async {
    final repo = ref.read(reviewRepositoryProvider);
    final review = await repo.getReviewForDate(day);
    if (mounted) {
      setState(() {
        _reflectionController.text = review?.reflection ?? '';
        _mistakesController.text = review?.mistakes ?? '';
        _lessonsController.text = review?.lessonsLearned ?? '';
        _disciplineScore = review?.disciplineScore ?? 5;
      });
    }
  }

  void _saveReview() async {
    final repo = ref.read(reviewRepositoryProvider);
    final now = DateTime.now();
    final existing = await repo.getReviewForDate(_selectedDay);

    final review = DailyReviewModel(
      id: existing?.id ?? const Uuid().v4(),
      reviewDate: _selectedDay,
      reflection: _reflectionController.text.trim(),
      mistakes: _mistakesController.text.trim(),
      lessonsLearned: _lessonsController.text.trim(),
      disciplineScore: _disciplineScore,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );

    await repo.saveReview(review);
    if (mounted) {
      AppDialogs.showSnackBar(context, 'Daily review saved');
    }
  }

  @override
  Widget build(BuildContext context) {
    final allTrades = ref.watch(allTradesStreamProvider).value ?? [];
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    // Filter trades for the selected day
    final dayTrades = allTrades
        .where((t) => DateTimeUtils.isSameDay(t.tradeDate, _selectedDay))
        .toList();
    final daySummary = TradingCalculationEngine.calculateSummary(dayTrades);

    // Build map of day -> P&L for calendar coloring
    final Map<int, double> monthDailyPnL = {};
    for (final t in allTrades) {
      if (t.tradeDate.year == _selectedMonth.year &&
          t.tradeDate.month == _selectedMonth.month &&
          t.isClosed) {
        monthDailyPnL[t.tradeDate.day] =
            (monthDailyPnL[t.tradeDate.day] ?? 0.0) + t.netPnL;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(title: const Text('Daily Review')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Month Navigation: < Month Year >
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: AppColors.primaryGold,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedMonth = DateTime(
                          _selectedMonth.year,
                          _selectedMonth.month - 1,
                          1,
                        );
                      });
                    },
                  ),
                  Text(
                    DateTimeUtils.formatMonthYear(_selectedMonth),
                    style: const TextStyle(
                      color: AppColors.primaryGold,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryGold,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedMonth = DateTime(
                          _selectedMonth.year,
                          _selectedMonth.month + 1,
                          1,
                        );
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Calendar Grid (exact match to reference screenshot)
              _buildCalendarGrid(monthDailyPnL),

              const SizedBox(height: 12),

              // Legend: ● Profit  ● Loss  ● No Trade  ■ Selected
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendDot(AppColors.profitGreen, 'Profit'),
                  const SizedBox(width: 14),
                  _buildLegendDot(AppColors.lossRed, 'Loss'),
                  const SizedBox(width: 14),
                  _buildLegendDot(AppColors.inputBackground, 'No Trade'),
                  const SizedBox(width: 14),
                  _buildLegendDot(
                    AppColors.primaryGold,
                    'Selected',
                    isSquare: true,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Selected Day Summary Card (exact match to reference screenshot)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeUtils.formatTradeDate(_selectedDay),
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Net P&L',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              CurrencyFormatter.format(
                                daySummary.netPnL,
                                currencySymbol: currencySymbol,
                                showSign: true,
                              ),
                              style: TextStyle(
                                color: daySummary.netPnL >= 0
                                    ? AppColors.profitGreen
                                    : AppColors.lossRed,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Trades',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${daySummary.totalClosedTrades}',
                              style: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Win Rate',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              CurrencyFormatter.formatPercent(
                                daySummary.winRate,
                              ),
                              style: const TextStyle(
                                color: AppColors.primaryGold,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Daily Reflection Form
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daily Reflection & Discipline',
                      style: TextStyle(
                        color: AppColors.primaryGold,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Discipline Rating
                    Row(
                      children: [
                        const Text(
                          'Discipline Score: ',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13,
                          ),
                        ),
                        ...List.generate(5, (index) {
                          final star = index + 1;
                          return IconButton(
                            iconSize: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              star <= _disciplineScore
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.primaryGold,
                            ),
                            onPressed: () =>
                                setState(() => _disciplineScore = star),
                          );
                        }),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Reflection Text Field
                    TextField(
                      controller: _reflectionController,
                      maxLines: 3,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        hintText:
                            'What went well? How was your mental state today?',
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: _mistakesController,
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Any mistakes made or rules bent?',
                      ),
                    ),

                    const SizedBox(height: 16),

                    GoldButton(
                      text: 'Save Daily Review',
                      height: 44,
                      borderRadius: 12,
                      onPressed: _saveReview,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(Map<int, double> monthDailyPnL) {
    const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final daysInMonth = DateUtils.getDaysInMonth(
      _selectedMonth.year,
      _selectedMonth.month,
    );
    final firstDayWeekday =
        DateTime(_selectedMonth.year, _selectedMonth.month, 1).weekday % 7;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldBorder.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          // Days of week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek.map((day) {
              return SizedBox(
                width: 36,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),

          // Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: firstDayWeekday + daysInMonth,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              if (index < firstDayWeekday) {
                return const SizedBox.shrink();
              }
              final dayNum = index - firstDayWeekday + 1;
              final dayDate = DateTime(
                _selectedMonth.year,
                _selectedMonth.month,
                dayNum,
              );
              final isSelected = DateTimeUtils.isSameDay(dayDate, _selectedDay);
              final hasPnL = monthDailyPnL.containsKey(dayNum);
              final pnl = monthDailyPnL[dayNum] ?? 0.0;

              Color? dotColor;
              if (hasPnL) {
                dotColor = pnl > 0.0001
                    ? AppColors.profitGreen
                    : (pnl < -0.0001
                          ? AppColors.lossRed
                          : AppColors.breakevenAmber);
              }

              return GestureDetector(
                onTap: () {
                  setState(() => _selectedDay = dayDate);
                  _loadReviewForDay(dayDate);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryGold
                        : (dotColor != null
                              ? dotColor.withValues(alpha: 0.2)
                              : Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.brightGold
                          : (dotColor ?? AppColors.inputBorder),
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      dayNum.toString(),
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.mainBackground
                            : (dotColor != null
                                  ? AppColors.primaryText
                                  : AppColors.secondaryText),
                        fontSize: 12,
                        fontWeight: isSelected || dotColor != null
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLegendDot(Color color, String label, {bool isSquare = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: isSquare ? BorderRadius.circular(2) : null,
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(color: AppColors.secondaryText, fontSize: 11),
        ),
      ],
    );
  }
}
