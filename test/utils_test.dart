import 'package:flutter_test/flutter_test.dart';
import 'package:tradetrack_journal/core/utils/currency_formatter.dart';
import 'package:tradetrack_journal/core/utils/date_time_utils.dart';

void main() {
  group('CurrencyFormatter Tests', () {
    test('format standard currency values', () {
      expect(CurrencyFormatter.format(12450.50), '₹12,450.50');
      expect(
        CurrencyFormatter.format(12450.50, currencySymbol: '\$'),
        '\$12,450.50',
      );
      expect(
        CurrencyFormatter.format(500.0, showSign: true),
        '+ ₹500.00',
      );
      expect(
        CurrencyFormatter.format(-750.25, showSign: true),
        '- ₹750.25',
      );
      expect(
        CurrencyFormatter.format(-750.25, showSign: false),
        '- ₹750.25',
      );
    });

    test('formatCompact values correctly in Cr, L, K', () {
      expect(CurrencyFormatter.formatCompact(15000000), '₹1.5Cr');
      expect(CurrencyFormatter.formatCompact(250000), '₹2.5L');
      expect(CurrencyFormatter.formatCompact(5500), '₹5.5K');
      expect(CurrencyFormatter.formatCompact(450), '₹450');
      expect(CurrencyFormatter.formatCompact(-12000), '-₹12.0K');
    });

    test('formatPercent and formatRatio and formatRMultiple', () {
      expect(CurrencyFormatter.formatPercent(55.25), '55.3%');
      expect(CurrencyFormatter.formatPercent(55.25, showSign: true), '+55.3%');
      expect(CurrencyFormatter.formatPercent(-12.4), '-12.4%');

      expect(CurrencyFormatter.formatRatio(2.5), '1:2.5');
      expect(CurrencyFormatter.formatRatio(null), 'N/A');
      expect(CurrencyFormatter.formatRatio(double.nan), 'N/A');

      expect(CurrencyFormatter.formatRMultiple(3.2), '+3.2R');
      expect(CurrencyFormatter.formatRMultiple(-1.0), '-1.0R');
      expect(CurrencyFormatter.formatRMultiple(null), 'N/A');
    });
  });

  group('DateTimeUtils Tests', () {
    final testDate = DateTime(2025, 4, 15, 14, 30);

    test('format dates correctly', () {
      expect(DateTimeUtils.formatTradeDate(testDate), '15 Apr 2025');
      expect(DateTimeUtils.formatMonthYear(testDate), 'April 2025');
      expect(DateTimeUtils.formatMonthDay(testDate), '15 Apr');
      expect(
        DateTimeUtils.formatFullDateTime(testDate),
        '15 Apr 2025, 02:30 PM',
      );
    });

    test('isSameDay works', () {
      final sameDayMorning = DateTime(2025, 4, 15, 9, 0);
      final nextDay = DateTime(2025, 4, 16, 14, 30);

      expect(DateTimeUtils.isSameDay(testDate, sameDayMorning), isTrue);
      expect(DateTimeUtils.isSameDay(testDate, nextDay), isFalse);
    });

    test('startOfDay and endOfDay', () {
      final start = DateTimeUtils.startOfDay(testDate);
      expect(start, DateTime(2025, 4, 15, 0, 0, 0, 0));

      final end = DateTimeUtils.endOfDay(testDate);
      expect(end, DateTime(2025, 4, 15, 23, 59, 59, 999));
    });
  });
}
