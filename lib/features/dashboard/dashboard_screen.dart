import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../domain/models/trade_enums.dart';
import '../../domain/models/financial_summary.dart';
import '../../shared/widgets/financial_metric_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dashboardSummaryProvider);
    final selectedFilter = ref.watch(dashboardDateRangeProvider);
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: null,
        backgroundColor: AppColors.mainBackground,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(
              Icons.home_outlined,
              color: AppColors.primaryGold,
              size: 26,
            ),
            onPressed: () {},
          ),
        ),
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.primaryGold,
              size: 24,
            ),
            onPressed: () => context.push('/daily-review'),
          ),
          const SizedBox(width: 8),
        ],
        flexibleSpace: SafeArea(
          child: Center(
            child: PopupMenuButton<DateRangeFilter>(
              initialValue: selectedFilter,
              color: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: AppColors.goldBorder.withValues(alpha: 0.3),
                ),
              ),
              onSelected: (DateRangeFilter filter) async {
                if (filter == DateRangeFilter.custom) {
                  final range = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: AppColors.primaryGold,
                            onPrimary: AppColors.mainBackground,
                            surface: AppColors.cardBackground,
                            onSurface: AppColors.primaryText,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (range != null) {
                    ref.read(dashboardCustomRangeProvider.notifier).state =
                        range;
                    ref.read(dashboardDateRangeProvider.notifier).state =
                        filter;
                  }
                } else {
                  ref.read(dashboardCustomRangeProvider.notifier).state = null;
                  ref.read(dashboardDateRangeProvider.notifier).state = filter;
                }
              },
              itemBuilder: (context) => DateRangeFilter.values.map((f) {
                return PopupMenuItem<DateRangeFilter>(
                  value: f,
                  child: Text(
                    f.label,
                    style: TextStyle(
                      color: f == selectedFilter
                          ? AppColors.brightGold
                          : AppColors.primaryText,
                      fontWeight: f == selectedFilter
                          ? FontWeight.w700
                          : FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedFilter.label,
                      style: const TextStyle(
                        color: AppColors.primaryGold,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: AppColors.primaryGold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: summary.totalClosedTrades == 0 && summary.openTradesCount == 0
          ? _buildEmptyState(context)
          : RefreshIndicator(
              color: AppColors.primaryGold,
              backgroundColor: AppColors.cardBackground,
              onRefresh: () async {
                ref.invalidate(allTradesStreamProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 4 Metric Cards (2x2 Grid)
                    Row(
                      children: [
                        Expanded(
                          child: FinancialMetricCard(
                            title: 'Net P&L',
                            value: CurrencyFormatter.format(
                              summary.netPnL,
                              currencySymbol: currencySymbol,
                              showSign: false,
                            ),
                            badgeText: CurrencyFormatter.formatPercent(
                              summary.returnPercentage,
                              showSign: true,
                            ),
                            isBadgePositive: summary.netPnL >= 0,
                            valueColor: summary.netPnL >= 0
                                ? AppColors.profitGreen
                                : AppColors.lossRed,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FinancialMetricCard(
                            title: 'Win Rate',
                            value: CurrencyFormatter.formatPercent(
                              summary.winRate,
                            ),
                            icon: Icons.track_changes,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FinancialMetricCard(
                            title: 'Profit Factor',
                            value: summary.profitFactor != null
                                ? summary.profitFactor!.toStringAsFixed(2)
                                : (summary.winningTrades > 0 ? '∞' : '0.00'),
                            icon: Icons.trending_up,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FinancialMetricCard(
                            title: 'Total Trades',
                            value: summary.totalClosedTrades.toString(),
                            icon: Icons.checklist_rtl_rounded,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Cumulative P&L Line Chart
                    _buildCumulativePnLCard(summary, currencySymbol),

                    const SizedBox(height: 18),

                    // Daily P&L Bar Chart
                    _buildDailyPnLCard(summary, currencySymbol),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.goldBorder.withValues(alpha: 0.4),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
                size: 40,
                color: AppColors.primaryGold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Trades Recorded Yet',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start logging your trades to unlock live P&L charts, strategy win-rates, and financial analytics.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.push('/add-trade'),
              icon: const Icon(Icons.add, color: AppColors.mainBackground),
              label: const Text('Add Your First Trade'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGold,
                foregroundColor: AppColors.mainBackground,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCumulativePnLCard(
    FinancialSummary summary,
    String currencySymbol,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldBorder.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cumulative P&L',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 180,
            child: summary.equityCurve.isEmpty
                ? const Center(
                    child: Text(
                      'No closed trade data for chart',
                      style: TextStyle(
                        color: AppColors.mutedText,
                        fontSize: 12,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: _calculateInterval(
                          summary.equityCurve,
                        ),
                        getDrawingHorizontalLine: (val) => FlLine(
                          color: AppColors.divider.withValues(alpha: 0.7),
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 42,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                CurrencyFormatter.formatCompact(
                                  value,
                                  currencySymbol: '',
                                ),
                                style: const TextStyle(
                                  color: AppColors.mutedText,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 24,
                            interval: (summary.equityCurve.length / 4).clamp(
                              1.0,
                              100.0,
                            ),
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 &&
                                  index < summary.equityCurve.length) {
                                final point = summary.equityCurve[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    '${point.date.day} ${_monthShort(point.date.month)}',
                                    style: const TextStyle(
                                      color: AppColors.mutedText,
                                      fontSize: 10,
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: summary.equityCurve.asMap().entries.map((e) {
                            return FlSpot(
                              e.key.toDouble(),
                              e.value.cumulativePnL,
                            );
                          }).toList(),
                          isCurved: true,
                          curveSmoothness: 0.35,
                          color: summary.netPnL >= 0
                              ? AppColors.profitGreen
                              : AppColors.lossRed,
                          barWidth: 2.2,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: summary.netPnL >= 0
                                  ? [
                                      AppColors.profitGreen.withValues(
                                        alpha: 0.28,
                                      ),
                                      AppColors.profitGreen.withValues(
                                        alpha: 0.0,
                                      ),
                                    ]
                                  : [
                                      AppColors.lossRed.withValues(alpha: 0.28),
                                      AppColors.lossRed.withValues(alpha: 0.0),
                                    ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyPnLCard(FinancialSummary summary, String currencySymbol) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldBorder.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily P&L',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 160,
            child: summary.dailyPnLList.isEmpty
                ? const Center(
                    child: Text(
                      'No daily trades in this period',
                      style: TextStyle(
                        color: AppColors.mutedText,
                        fontSize: 12,
                      ),
                    ),
                  )
                : BarChart(
                    BarChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (val) => FlLine(
                          color: AppColors.divider.withValues(alpha: 0.7),
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                CurrencyFormatter.formatCompact(
                                  value,
                                  currencySymbol: '',
                                ),
                                style: const TextStyle(
                                  color: AppColors.mutedText,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 22,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 &&
                                  index < summary.dailyPnLList.length) {
                                final point = summary.dailyPnLList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    point.date.day.toString(),
                                    style: const TextStyle(
                                      color: AppColors.mutedText,
                                      fontSize: 10,
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: summary.dailyPnLList.asMap().entries.map((e) {
                        final point = e.value;
                        final isProfit = point.netPnL >= 0;
                        return BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: point.netPnL,
                              color: isProfit
                                  ? AppColors.profitGreen
                                  : AppColors.lossRed,
                              width: 8,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  double _calculateInterval(List<EquityPoint> curve) {
    if (curve.isEmpty) return 1000.0;
    double minVal = curve.first.cumulativePnL;
    double maxVal = curve.first.cumulativePnL;
    for (final p in curve) {
      if (p.cumulativePnL < minVal) minVal = p.cumulativePnL;
      if (p.cumulativePnL > maxVal) maxVal = p.cumulativePnL;
    }
    final range = (maxVal - minVal).abs();
    if (range <= 0) return 1000.0;
    return (range / 3).clamp(500.0, 100000.0);
  }

  String _monthShort(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[(month - 1).clamp(0, 11)];
  }
}
