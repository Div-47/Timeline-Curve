import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('EEEE h:mm a');
  return formatter.format(dateTime);
}
