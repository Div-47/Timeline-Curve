class TimeLineValues {
  DateTime date;
  String event;

  TimeLineValues({required this.date, required this.event});
}

List<TimeLineValues> values = [
  TimeLineValues(
    date: DateTime(2023, 12, 18, 1),
    event: "Task 1",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 19, 16),
    event: "React Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 20, 10),
    event: "Python Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 21, 5),
    event: "Ruby Task",
  ),
  TimeLineValues(
    date: DateTime(2023, 12, 23, 18),
    event: "Flutter Task",
  ),
];
