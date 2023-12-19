part of 'time_line_curve_bloc.dart';

sealed class TimeLineCurveEvent {
  const TimeLineCurveEvent();
}

final class TimeLineCurveDataEvent extends TimeLineCurveEvent {
  final BuildContext context;
  const TimeLineCurveDataEvent(this.timeLineValues,this.context);

  final List<TimeLineValues> timeLineValues;
}
