import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:timeline_curve/models/TimeLineModel.dart';

part 'time_line_curve_event.dart';
part 'time_line_curve_state.dart';

class TimeLineCurveBloc extends Bloc<TimeLineCurveEvent, TimeLineCurveState> {
  TimeLineCurveBloc() : super(TimeLineCurveInitial()) {
    on<TimeLineCurveDataEvent>((event, emit) {
      emit(TimeLineCurveDataSuccess(event.timeLineValues));

    });
  }
}
