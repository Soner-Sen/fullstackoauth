import 'package:intl/intl.dart';

class DateTimeConverter {
  static String formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static DateTime? parseDate(String date) {
    try {
      return DateFormat('dd.MM.yyyy').parse(date);
    } catch (_) {
      return null;
    }
  }
}
