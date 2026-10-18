import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_time_utils.dart';
import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';
import '../../shared/widgets/status_badge.dart';

class TradeJournalScreen extends ConsumerWidget {
  const TradeJournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trades = ref.watch(journalFilteredTradesProvider);
    final selectedMarket = ref.watch(journalMarketFilterProvider);
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: const Text('Trade Journal'),
        leading: IconButton(
          icon: const Icon(Icons.sort, color: AppColors.primaryGold),
          onPressed: () => _showFilterSheet(context, ref),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppColors.primaryGold),
            onPressed: () => _showFilterSheet(context, ref),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: TextField(
                onChanged: (val) {
                  ref.read(journalSearchQueryProvider.notifier).state = val;
                },
                style: const TextStyle(color: AppColors.primaryText),
                decoration: InputDecoration(
                  hintText: 'Search trades...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.mutedText,
                    size: 20,
                  ),
                  suffixIcon: ref.watch(journalSearchQueryProvider).isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            size: 18,
                            color: AppColors.mutedText,
                          ),
                          onPressed: () =>
                              ref
                                      .read(journalSearchQueryProvider.notifier)
                                      .state =
                                  '',
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.inputBackground,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.goldBorder.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ),

            // Market Filter Pills (All | NSE | Forex)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              child: Row(
                children: [
                  _buildMarketPill(
                    label: 'All',
                    isSelected: selectedMarket == null,
                    onTap: () =>
                        ref.read(journalMarketFilterProvider.notifier).state =
                            null,
                  ),
                  const SizedBox(width: 8),
                  _buildMarketPill(
                    label: 'NSE',
                    isSelected: selectedMarket == MarketType.nse,
                    onTap: () =>
                        ref.read(journalMarketFilterProvider.notifier).state =
                            MarketType.nse,
                  ),
                  const SizedBox(width: 8),
                  _buildMarketPill(
                    label: 'Forex',
                    isSelected: selectedMarket == MarketType.forex,
                    onTap: () =>
                        ref.read(journalMarketFilterProvider.notifier).state =
                            MarketType.forex,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // Trades List
            Expanded(
              child: trades.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 48,
                            color: AppColors.mutedText.withValues(alpha: 0.6),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No matching trades found',
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      itemCount: trades.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final trade = trades[index];
                        return _buildTradeItem(context, trade, currencySymbol);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketPill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGold : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryGold
                : AppColors.goldBorder.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? AppColors.mainBackground
                : AppColors.secondaryText,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildTradeItem(
    BuildContext context,
    TradeModel trade,
    String currencySymbol,
  ) {
    final isProfit = trade.netPnL > 0.0001;
    final isLoss = trade.netPnL < -0.0001;
    final pnlColor = isProfit
        ? AppColors.profitGreen
        : (isLoss ? AppColors.lossRed : AppColors.secondaryText);

    return InkWell(
      onTap: () => context.push('/trade-details/${trade.id}'),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
            // Avatar
            InstrumentAvatar(
              symbol: trade.symbol,
              market: trade.market,
              size: 40,
            ),
            const SizedBox(width: 14),

            // Middle Column: Symbol, Date • Direction, Strategy
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trade.symbol,
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        DateTimeUtils.formatTradeDate(trade.tradeDate),
                        style: const TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 11,
                        ),
                      ),
                      const Text(
                        '  •  ',
                        style: TextStyle(
                          color: AppColors.mutedText,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        trade.direction.label,
                        style: TextStyle(
                          color: trade.direction == TradeDirection.buy
                              ? AppColors.profitGreen
                              : AppColors.lossRed,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  StrategyTag(label: trade.strategy),
                ],
              ),
            ),

            // Right Column: Net P&L and Chevron
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (trade.isOpen)
                  const StatusBadge(
                    outcome: TradeOutcome.open,
                    status: TradeStatus.open,
                  )
                else
                  Text(
                    CurrencyFormatter.format(
                      trade.netPnL,
                      currencySymbol: currencySymbol,
                      showSign: true,
                    ),
                    style: TextStyle(
                      color: pnlColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: AppColors.mutedText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context, WidgetRef ref) {
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
              const Text(
                'Filter by Outcome',
                style: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('All Outcomes'),
                    selected: ref.watch(journalOutcomeFilterProvider) == null,
                    onSelected: (_) {
                      ref.read(journalOutcomeFilterProvider.notifier).state =
                          null;
                      Navigator.pop(ctx);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Wins'),
                    selected:
                        ref.watch(journalOutcomeFilterProvider) ==
                        TradeOutcome.win,
                    onSelected: (_) {
                      ref.read(journalOutcomeFilterProvider.notifier).state =
                          TradeOutcome.win;
                      Navigator.pop(ctx);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Losses'),
                    selected:
                        ref.watch(journalOutcomeFilterProvider) ==
                        TradeOutcome.loss,
                    onSelected: (_) {
                      ref.read(journalOutcomeFilterProvider.notifier).state =
                          TradeOutcome.loss;
                      Navigator.pop(ctx);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Breakeven'),
                    selected:
                        ref.watch(journalOutcomeFilterProvider) ==
                        TradeOutcome.breakeven,
                    onSelected: (_) {
                      ref.read(journalOutcomeFilterProvider.notifier).state =
                          TradeOutcome.breakeven;
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
