import 'package:intl/intl.dart';

class DateTimeUtils {
  static final DateFormat _tradeDateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _shortMonthYear = DateFormat('MMMM yyyy');
  static final DateFormat _monthDay = DateFormat('d MMM');
  static final DateFormat _fullDateTime = DateFormat('dd MMM yyyy, hh:mm a');

  static String formatTradeDate(DateTime date) {
    return _tradeDateFormat.format(date);
  }

  static String formatMonthYear(DateTime date) {
    return _shortMonthYear.format(date);
  }

  static String formatMonthDay(DateTime date) {
    return _monthDay.format(date);
  }

  static String formatFullDateTime(DateTime date) {
    return _fullDateTime.format(date);
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }
}
