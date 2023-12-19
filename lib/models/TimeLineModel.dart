class TimeLineValues {
  DateTime date;
  String event;

  TimeLineValues({required this.date, required this.event});
}

List<TimeLineValues> values = [
  TimeLineValues(
    date: DateTime(2023, 12, 18, 13),
    event: "React Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 20, 10),
    event: "Python Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 21, 16),
    event: "Ruby Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 23, 8),
    event: "Flutter Task",
  ),
];
String getDayName(int dayOfWeek) {
  switch (dayOfWeek) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return 'Invalid Day';
  }
}
