import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../domain/models/trade_enums.dart';

class StatusBadge extends StatelessWidget {
  final TradeOutcome outcome;
  final TradeStatus status;

  const StatusBadge({
    super.key,
    required this.outcome,
    this.status = TradeStatus.closed,
  });

  @override
  Widget build(BuildContext context) {
    if (status == TradeStatus.open) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primaryGold.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.primaryGold.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: const Text(
          'Open',
          style: TextStyle(
            color: AppColors.brightGold,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Color bgColor;
    Color textColor;
    String label;

    switch (outcome) {
      case TradeOutcome.win:
        bgColor = AppColors.profitGreen.withValues(alpha: 0.15);
        textColor = AppColors.profitGreen;
        label = 'Win';
        break;
      case TradeOutcome.loss:
        bgColor = AppColors.lossRed.withValues(alpha: 0.15);
        textColor = AppColors.lossRed;
        label = 'Loss';
        break;
      case TradeOutcome.breakeven:
        bgColor = AppColors.breakevenAmber.withValues(alpha: 0.15);
        textColor = AppColors.breakevenAmber;
        label = 'Breakeven';
        break;
      case TradeOutcome.open:
        bgColor = AppColors.primaryGold.withValues(alpha: 0.15);
        textColor = AppColors.brightGold;
        label = 'Open';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class StrategyTag extends StatelessWidget {
  final String label;
  final Color? color;

  const StrategyTag({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primaryGold).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color ?? AppColors.secondaryText,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class InstrumentAvatar extends StatelessWidget {
  final String symbol;
  final MarketType market;
  final double size;

  const InstrumentAvatar({
    super.key,
    required this.symbol,
    required this.market,
    this.size = 38.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.elevatedBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.goldBorder.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          symbol.isNotEmpty ? symbol.substring(0, 1).toUpperCase() : '?',
          style: TextStyle(
            color: AppColors.primaryGold,
            fontSize: size * 0.42,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
