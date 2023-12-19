part of 'time_line_curve_bloc.dart';

@immutable
sealed class TimeLineCurveState {}

final class TimeLineCurveInitial extends TimeLineCurveState {}

final class TimeLineCurveDataSuccess extends TimeLineCurveState {
  final List<TimeLineValues> timeLineValues;

  TimeLineCurveDataSuccess(this.timeLineValues);
}
