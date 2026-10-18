import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../domain/models/strategy_model.dart';
import '../../domain/models/trade_enums.dart';
import '../../shared/widgets/app_dialogs.dart';

class StrategyManagerScreen extends ConsumerWidget {
  const StrategyManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strategyStats = ref.watch(strategyStatsListProvider);
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(title: const Text('Strategies')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              // "+ Add Strategy" Button (exact match to reference screenshot)
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => _showAddStrategyDialog(context, ref),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.primaryGold,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add Strategy',
                            style: TextStyle(
                              color: AppColors.primaryGold,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Strategy Cards List
              if (strategyStats.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Center(
                    child: Text(
                      'No strategies added yet',
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: strategyStats.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final stat = strategyStats[index];
                    return _buildStrategyCard(
                      context,
                      ref,
                      stat,
                      currencySymbol,
                    );
                  },
                ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStrategyCard(
    BuildContext context,
    WidgetRef ref,
    StrategyStats stat,
    String currencySymbol,
  ) {
    final strategy = stat.strategy;
    final isProfit = stat.netPnL >= 0;
    final pnlColor = isProfit ? AppColors.profitGreen : AppColors.lossRed;
    final Color dotColor = _parseColor(strategy.colorHex);

    return InkWell(
      onTap: () =>
          _showStrategyDetailsModal(context, ref, stat, currencySymbol),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.goldBorder.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Left Color Dot
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 14),

            // Middle: Strategy Name and Market • Trades
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strategy.name,
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${strategy.market.label}  •  ${stat.totalTrades} trades',
                    style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Right: Net P&L and Win Rate %
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  CurrencyFormatter.format(
                    stat.netPnL,
                    currencySymbol: currencySymbol,
                    showSign: true,
                  ),
                  style: TextStyle(
                    color: pnlColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${stat.winRate.toStringAsFixed(0)}% win rate',
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddStrategyDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    MarketType market = MarketType.nse;
    String colorHex = '#27C982';

    final colors = [
      '#27C982',
      '#2196F3',
      '#F05A67',
      '#9C27B0',
      '#E5A93C',
      '#00BCD4',
      '#4CAF50',
      '#D4AF37',
    ];

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: AppColors.goldBorder.withValues(alpha: 0.3),
                ),
              ),
              title: const Text(
                'Add Strategy',
                style: TextStyle(color: AppColors.primaryGold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Strategy Name',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: nameController,
                      style: const TextStyle(color: AppColors.primaryText),
                      decoration: const InputDecoration(
                        hintText: 'e.g. Opening Range Breakout',
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: descController,
                      style: const TextStyle(color: AppColors.primaryText),
                      decoration: const InputDecoration(
                        hintText: 'Strategy rules, entry triggers...',
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Market',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('NSE'),
                          selected: market == MarketType.nse,
                          onSelected: (_) =>
                              setState(() => market = MarketType.nse),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Forex'),
                          selected: market == MarketType.forex,
                          onSelected: (_) =>
                              setState(() => market = MarketType.forex),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Tag Color',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: colors.map((hex) {
                        final isSel = colorHex == hex;
                        return GestureDetector(
                          onTap: () => setState(() => colorHex = hex),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: _parseColor(hex),
                              shape: BoxShape.circle,
                              border: isSel
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGold,
                    foregroundColor: AppColors.mainBackground,
                  ),
                  onPressed: () async {
                    final name = nameController.text.trim();
                    if (name.isEmpty) return;

                    final strat = StrategyModel(
                      id: const Uuid().v4(),
                      name: name,
                      description: descController.text.trim(),
                      colorHex: colorHex,
                      market: market,
                      createdAt: DateTime.now(),
                    );

                    await ref
                        .read(strategyRepositoryProvider)
                        .insertStrategy(strat);
                    if (context.mounted) {
                      Navigator.pop(ctx);
                      AppDialogs.showSnackBar(context, 'Strategy created');
                    }
                  },
                  child: const Text('Create Strategy'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showStrategyDetailsModal(
    BuildContext context,
    WidgetRef ref,
    StrategyStats stat,
    String currencySymbol,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stat.strategy.name,
                    style: const TextStyle(
                      color: AppColors.primaryGold,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.lossRed,
                    ),
                    onPressed: () async {
                      final confirmed = await AppDialogs.showConfirmDialog(
                        context: context,
                        title: 'Delete Strategy',
                        message: 'Delete this strategy? Historical trades will keep their strategy name.',
                      );
                      if (confirmed) {
                        await ref
                            .read(strategyRepositoryProvider)
                            .deleteStrategy(stat.strategy.id);
                        if (ctx.mounted) Navigator.pop(ctx);
                      }
                    },
                  ),
                ],
              ),
              if (stat.isSampleSizeSmall)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.breakevenAmber.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.breakevenAmber.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 18,
                        color: AppColors.breakevenAmber,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Sample size under 10 trades. Collect more data for reliable metrics.',
                          style: TextStyle(
                            color: AppColors.breakevenAmber,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              _buildModalMetricRow(
                'Net P&L',
                CurrencyFormatter.format(
                  stat.netPnL,
                  currencySymbol: currencySymbol,
                  showSign: true,
                ),
              ),
              _buildModalMetricRow(
                'Win Rate',
                '${stat.winRate.toStringAsFixed(1)}% (${stat.winningTrades}W / ${stat.losingTrades}L)',
              ),
              _buildModalMetricRow(
                'Average Winner',
                CurrencyFormatter.format(
                  stat.avgWinner,
                  currencySymbol: currencySymbol,
                ),
              ),
              _buildModalMetricRow(
                'Average Loser',
                CurrencyFormatter.format(
                  stat.avgLoser,
                  currencySymbol: currencySymbol,
                ),
              ),
              _buildModalMetricRow(
                'Profit Factor',
                stat.profitFactor != null
                    ? stat.profitFactor!.toStringAsFixed(2)
                    : (stat.winningTrades > 0 ? '∞' : '0.00'),
              ),
              _buildModalMetricRow(
                'Expectancy',
                CurrencyFormatter.format(
                  stat.expectancy,
                  currencySymbol: currencySymbol,
                  showSign: true,
                ),
              ),
              _buildModalMetricRow(
                'Rule Adherence',
                '${stat.ruleAdherencePercent.toStringAsFixed(0)}%',
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalMetricRow(String label, String value) {
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
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String hex) {
    try {
      final buffer = StringBuffer();
      if (hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return AppColors.primaryGold;
    }
  }
}
