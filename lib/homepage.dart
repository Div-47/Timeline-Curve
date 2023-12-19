import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_curve/bloc/time_line_curve_bloc.dart';
import 'package:timeline_curve/helpers/time_format.dart';
import 'package:timeline_curve/models/TimeLineModel.dart';
import 'package:timeline_curve/timeline_curve_painter.dart';
import 'package:touchable/touchable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);

    _controller.forward();
    context
        .read<TimeLineCurveBloc>()
        .add(TimeLineCurveDataEvent(values, context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TimeLineCurveBloc, TimeLineCurveState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
                child: state is TimeLineCurveDataSuccess
                    ? Column(
                        children: [
                          AnimatedBuilder(
                              animation: _controller,
                              builder: (ctx, child) {
                                return CanvasTouchDetector(
                                    gesturesToOverride: [GestureType.onTapDown],
                                    builder: (context) {
                                      return CustomPaint(
                                        size: Size(
                                            MediaQuery.of(context).size.width,
                                            400),
                                        painter: PathPainter(
                                            context: context,
                                            timeLineValues:
                                                state.timeLineValues,
                                            value: _controller.value,
                                            chartHeight: 400),
                                      );
                                    });
                              })
                        ],
                      )
                    : Center(child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }
}

void showPopupMenu(
    BuildContext context, TapDownDetails details, TimeLineValues value) {
  showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          details.localPosition.dx,
          details.localPosition.dy,
          details.localPosition.dx,
          details.localPosition.dy),
      items: [
        PopupMenuItem(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value.event),
            SizedBox(height: 2),
            Row(
              children: [Text(formatDate(value.date))],
            )
          ],
        )))
      ]);
}
