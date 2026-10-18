import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(
    double amount, {
    String currencySymbol = '₹',
    bool showSign = false,
    int decimalDigits = 2,
  }) {
    final absAmount = amount.abs();
    final formatter = NumberFormat.currency(
      symbol: '',
      decimalDigits: decimalDigits,
    );
    final formattedNumber = formatter.format(absAmount).trim();

    final sign = amount > 0 ? (showSign ? '+ ' : '') : (amount < 0 ? '- ' : '');

    return '$sign$currencySymbol$formattedNumber';
  }

  static String formatCompact(double amount, {String currencySymbol = '₹'}) {
    final sign = amount < 0 ? '-' : '';
    final absVal = amount.abs();

    if (absVal >= 10000000) {
      return '$sign$currencySymbol${(absVal / 10000000).toStringAsFixed(1)}Cr';
    } else if (absVal >= 100000) {
      return '$sign$currencySymbol${(absVal / 100000).toStringAsFixed(1)}L';
    } else if (absVal >= 1000) {
      return '$sign$currencySymbol${(absVal / 1000).toStringAsFixed(1)}K';
    } else {
      return '$sign$currencySymbol${absVal.toStringAsFixed(0)}';
    }
  }

  static String formatPercent(double percent, {bool showSign = false}) {
    final sign = percent > 0 ? (showSign ? '+' : '') : '';
    return '$sign${percent.toStringAsFixed(1)}%';
  }

  static String formatRatio(double? ratio) {
    if (ratio == null || ratio.isNaN || ratio.isInfinite) return 'N/A';
    return '1:${ratio.toStringAsFixed(1)}';
  }

  static String formatRMultiple(double? r) {
    if (r == null || r.isNaN || r.isInfinite) return 'N/A';
    final sign = r > 0 ? '+' : '';
    return '$sign${r.toStringAsFixed(1)}R';
  }
}
