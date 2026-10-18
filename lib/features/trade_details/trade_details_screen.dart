import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_time_utils.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/gold_button.dart';
import '../../shared/widgets/app_dialogs.dart';

class TradeDetailsScreen extends ConsumerStatefulWidget {
  final String tradeId;

  const TradeDetailsScreen({super.key, required this.tradeId});

  @override
  ConsumerState<TradeDetailsScreen> createState() => _TradeDetailsScreenState();
}

class _TradeDetailsScreenState extends ConsumerState<TradeDetailsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final allTrades = ref.watch(allTradesStreamProvider).value ?? [];
    final trade = allTrades.where((t) => t.id == widget.tradeId).firstOrNull;
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;

    if (trade == null) {
      return Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(title: const Text('Trade Details')),
        body: const Center(
          child: Text(
            'Trade not found',
            style: TextStyle(color: AppColors.secondaryText),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: const Text('Trade Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryGold),
          onPressed: () => context.pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            color: AppColors.cardBackground,
            icon: const Icon(Icons.more_vert, color: AppColors.primaryGold),
            onSelected: (val) {
              if (val == 'edit') {
                context.push('/edit-trade', extra: trade);
              } else if (val == 'delete') {
                _deleteTrade(context, trade.id);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('Edit Trade')),
              const PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Delete Trade',
                  style: TextStyle(color: AppColors.lossRed),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Card (exact match to reference screenshot)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.goldBorder.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          InstrumentAvatar(
                            symbol: trade.symbol,
                            market: trade.market,
                            size: 44,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trade.symbol,
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '${DateTimeUtils.formatTradeDate(trade.tradeDate)}  •  ${trade.market.label}  •  ${trade.direction.label}',
                                  style: const TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              StatusBadge(
                                outcome: trade.outcome,
                                status: trade.status,
                              ),
                              const SizedBox(height: 6),
                              StrategyTag(label: trade.strategy),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Segmented Tabs: Overview | Notes | Screenshot
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          _buildTabItem('Overview', 0),
                          _buildTabItem('Notes', 1),
                          _buildTabItem('Screenshot', 2),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Tab Content
                    if (_selectedTabIndex == 0)
                      _buildOverviewTab(trade, currencySymbol)
                    else if (_selectedTabIndex == 1)
                      _buildNotesTab(trade)
                    else
                      _buildScreenshotTab(trade),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom Actions: Gold Edit & Red Delete buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GoldButton(
                      text: 'Edit',
                      height: 48,
                      borderRadius: 12,
                      onPressed: () =>
                          context.push('/edit-trade', extra: trade),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => _deleteTrade(context, trade.id),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.lossRed.withValues(alpha: 0.8),
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppColors.lossRed.withValues(
                            alpha: 0.08,
                          ),
                        ),
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: AppColors.lossRed,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.elevatedBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? Border.all(color: AppColors.goldBorder.withValues(alpha: 0.3))
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.brightGold
                    : AppColors.secondaryText,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewTab(dynamic trade, String currencySymbol) {
    final isProfit = trade.netPnL > 0.0001;
    final isLoss = trade.netPnL < -0.0001;
    final pnlColor = isProfit
        ? AppColors.profitGreen
        : (isLoss ? AppColors.lossRed : AppColors.secondaryText);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldBorder.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          _buildDetailRow('Entry Price', trade.entryPrice.toStringAsFixed(2)),
          _buildDetailRow(
            'Exit Price',
            trade.exitPrice != null
                ? trade.exitPrice!.toStringAsFixed(2)
                : 'Open',
          ),
          _buildDetailRow('Quantity', trade.quantity.toString()),
          const Divider(color: AppColors.divider, height: 20),
          _buildDetailRow(
            'Gross P&L',
            CurrencyFormatter.format(
              trade.grossPnL,
              currencySymbol: currencySymbol,
            ),
          ),
          _buildDetailRow(
            'Total Costs',
            CurrencyFormatter.format(
              trade.totalCosts,
              currencySymbol: currencySymbol,
            ),
          ),
          _buildDetailRow(
            'Net P&L',
            trade.isOpen
                ? 'Open'
                : CurrencyFormatter.format(
                    trade.netPnL,
                    currencySymbol: currencySymbol,
                    showSign: true,
                  ),
            valueColor: pnlColor,
            isBold: true,
          ),
          const Divider(color: AppColors.divider, height: 20),
          _buildDetailRow(
            'Risk/Reward',
            CurrencyFormatter.formatRatio(trade.riskRewardRatio),
          ),
          _buildDetailRow(
            'R Multiple',
            CurrencyFormatter.formatRMultiple(trade.rMultiple),
          ),
          _buildDetailRow('Status', trade.status.label),
        ],
      ),
    );
  }

  Widget _buildNotesTab(dynamic trade) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldBorder.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNoteSection(
            'Entry Reason',
            trade.entryReason ?? 'No entry reason provided.',
          ),
          const Divider(color: AppColors.divider, height: 20),
          _buildNoteSection(
            'Exit Reason',
            trade.exitReason ?? 'No exit reason provided.',
          ),
          const Divider(color: AppColors.divider, height: 20),
          _buildNoteSection(
            'Emotional State',
            trade.emotionalState ?? 'Disciplined',
          ),
          const Divider(color: AppColors.divider, height: 20),
          _buildNoteSection(
            'Rule Following',
            trade.ruleFollowed ? 'Followed all rules' : 'Broken trading rule',
            textColor: trade.ruleFollowed
                ? AppColors.profitGreen
                : AppColors.lossRed,
          ),
          if (trade.mistakes != null && trade.mistakes!.isNotEmpty) ...[
            const Divider(color: AppColors.divider, height: 20),
            _buildNoteSection('Mistakes', trade.mistakes!),
          ],
        ],
      ),
    );
  }

  Widget _buildScreenshotTab(dynamic trade) {
    if (trade.screenshotPath == null || trade.screenshotPath!.isEmpty) {
      return Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.goldBorder.withValues(alpha: 0.2),
          ),
        ),
        child: const Center(
          child: Text(
            'No screenshot attached for this trade',
            style: TextStyle(color: AppColors.mutedText, fontSize: 13),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldBorder.withValues(alpha: 0.2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.file(
        File(trade.screenshotPath!),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Text(
              'Screenshot image unavailable',
              style: TextStyle(color: AppColors.mutedText),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color? valueColor,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.primaryText,
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteSection(String title, String content, {Color? textColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryGold,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: TextStyle(
            color: textColor ?? AppColors.primaryText,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  void _deleteTrade(BuildContext ctx, String tradeId) async {
    final confirmed = await AppDialogs.showConfirmDialog(
      context: ctx,
      title: 'Delete Trade',
      message: 'Are you sure you want to permanently delete this trade record?',
    );

    if (confirmed && mounted) {
      await ref.read(tradeRepositoryProvider).deleteTrade(tradeId);
      if (mounted) {
        AppDialogs.showSnackBar(context, 'Trade deleted');
        context.pop();
      }
    }
  }
}
