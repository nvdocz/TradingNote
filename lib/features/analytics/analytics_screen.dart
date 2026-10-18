import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../domain/models/financial_summary.dart';
import '../../domain/models/strategy_model.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(analyticsSummaryProvider);
    final strategyStats = ref.watch(strategyStatsListProvider);
    final selectedTimeframe = ref.watch(analyticsTimeframeProvider);
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(title: const Text('Analytics')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeframe Selector Pills (1M | 3M | 6M | 1Y | All)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['1M', '3M', '6M', '1Y', 'All'].map((tf) {
                  final isSelected = selectedTimeframe == tf;
                  return GestureDetector(
                    onTap: () =>
                        ref.read(analyticsTimeframeProvider.notifier).state =
                            tf,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryGold
                            : AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryGold
                              : AppColors.goldBorder.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tf,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.mainBackground
                              : AppColors.secondaryText,
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Strategy Performance Section (exact match to reference screenshot)
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
                      'Strategy Performance',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (strategyStats.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                          child: Text(
                            'No strategy trades in this period',
                            style: TextStyle(
                              color: AppColors.mutedText,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    else
                      ...strategyStats
                          .take(5)
                          .map(
                            (stat) => _buildStrategyPerformanceRow(
                              stat,
                              currencySymbol,
                            ),
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Win/Loss Distribution Donut Chart (exact match to reference)
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
                      'Win/Loss Distribution',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // Donut Chart with Center Text
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              PieChart(
                                PieChartData(
                                  sectionsSpace: 3,
                                  centerSpaceRadius: 42,
                                  sections: _buildPieSections(summary),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    summary.totalClosedTrades.toString(),
                                    style: const TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    'Trades',
                                    style: TextStyle(
                                      color: AppColors.mutedText,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Legend with Values and Percentages
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLegendItem(
                                color: AppColors.profitGreen,
                                label: 'Wins',
                                count: summary.winningTrades,
                                percent: summary.winRate,
                              ),
                              const SizedBox(height: 12),
                              _buildLegendItem(
                                color: AppColors.lossRed,
                                label: 'Losses',
                                count: summary.losingTrades,
                                percent: summary.lossRate,
                              ),
                              const SizedBox(height: 12),
                              _buildLegendItem(
                                color: AppColors.breakevenAmber,
                                label: 'Breakeven',
                                count: summary.breakevenTrades,
                                percent: summary.breakevenRate,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Comprehensive Metrics Cards
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
                      'Performance Metrics',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildMetricRow(
                      'Average Winner',
                      CurrencyFormatter.format(
                        summary.avgWinner,
                        currencySymbol: currencySymbol,
                      ),
                      valueColor: AppColors.profitGreen,
                    ),
                    _buildMetricRow(
                      'Average Loser',
                      CurrencyFormatter.format(
                        summary.avgLoser,
                        currencySymbol: currencySymbol,
                      ),
                      valueColor: AppColors.lossRed,
                    ),
                    _buildMetricRow(
                      'Expectancy',
                      CurrencyFormatter.format(
                        summary.expectancy,
                        currencySymbol: currencySymbol,
                        showSign: true,
                      ),
                    ),
                    _buildMetricRow(
                      'Profit Factor',
                      summary.profitFactor != null
                          ? summary.profitFactor!.toStringAsFixed(2)
                          : (summary.winningTrades > 0 ? '∞' : '0.00'),
                    ),
                    _buildMetricRow(
                      'Max Drawdown',
                      '${CurrencyFormatter.format(summary.maxDrawdown, currencySymbol: currencySymbol)} (${summary.maxDrawdownPercent.toStringAsFixed(1)}%)',
                    ),
                    _buildMetricRow(
                      'Average R-Multiple',
                      CurrencyFormatter.formatRMultiple(summary.avgRMultiple),
                    ),
                    _buildMetricRow(
                      'Long Trades',
                      '${summary.longTradesCount} (${CurrencyFormatter.format(summary.longNetPnL, currencySymbol: currencySymbol, showSign: true)})',
                    ),
                    _buildMetricRow(
                      'Short Trades',
                      '${summary.shortTradesCount} (${CurrencyFormatter.format(summary.shortNetPnL, currencySymbol: currencySymbol, showSign: true)})',
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

  Widget _buildStrategyPerformanceRow(
    StrategyStats stat,
    String currencySymbol,
  ) {
    final isProfit = stat.netPnL >= 0;
    final pnlColor = isProfit ? AppColors.profitGreen : AppColors.lossRed;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Strategy Name
          SizedBox(
            width: 90,
            child: Text(
              stat.strategy.name,
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),

          // Horizontal Bar Visualizer
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: 10,
                color: AppColors.inputBackground,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (stat.winRate / 100).clamp(0.05, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: pnlColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Net P&L
          SizedBox(
            width: 75,
            child: Text(
              CurrencyFormatter.format(
                stat.netPnL,
                currencySymbol: currencySymbol,
                showSign: true,
              ),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: pnlColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Win Rate %
          SizedBox(
            width: 38,
            child: Text(
              '${stat.winRate.toStringAsFixed(0)}%',
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieSections(FinancialSummary summary) {
    final total = summary.totalClosedTrades;
    if (total == 0) {
      return [
        PieChartSectionData(
          color: AppColors.divider,
          value: 1,
          radius: 18,
          showTitle: false,
        ),
      ];
    }

    return [
      if (summary.winningTrades > 0)
        PieChartSectionData(
          color: AppColors.profitGreen,
          value: summary.winningTrades.toDouble(),
          radius: 20,
          showTitle: false,
        ),
      if (summary.losingTrades > 0)
        PieChartSectionData(
          color: AppColors.lossRed,
          value: summary.losingTrades.toDouble(),
          radius: 20,
          showTitle: false,
        ),
      if (summary.breakevenTrades > 0)
        PieChartSectionData(
          color: AppColors.breakevenAmber,
          value: summary.breakevenTrades.toDouble(),
          radius: 20,
          showTitle: false,
        ),
    ];
  }

  Widget _buildLegendItem({
    required Color color,
    required String label,
    required int count,
    required double percent,
  }) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.secondaryText, fontSize: 13),
        ),
        const Spacer(),
        Text(
          '$count (${percent.toStringAsFixed(1)}%)',
          style: const TextStyle(
            color: AppColors.primaryText,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.primaryText,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
