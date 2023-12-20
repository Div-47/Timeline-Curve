import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timeline_curve/helpers/popupMenu.dart';
import 'package:timeline_curve/homepage.dart';
import 'package:timeline_curve/models/TimeLineModel.dart';
import 'package:touchable/touchable.dart';

class PathPainter extends CustomPainter {
  BuildContext context;
  List<TimeLineValues> timeLineValues;
  Path path = Path();
  double chartHeight;

  double value;
  PathPainter(
      {required this.context,
      required this.timeLineValues,
      required this.value,
      required this.chartHeight});
  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    drawPath(chartHeight, timeLineValues, context, myCanvas, value);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

Path drawPath(chartHeight, List<TimeLineValues> timeLineValues, context,
    TouchyCanvas canvas, double value) {
  final width = MediaQuery.of(context).size.width;
  final double height = chartHeight;
  final path = Path();

  List<Offset> points = [];
  // List<Offset> xPoints = [];
  // List<Offset> yPoints = [];

  // for (var i = 0; i < 7; i++) {
  //   xPoints.add(Offset((10 + ((width) / 7) * i), 400.0));
  // }
  // for (var i = 0; i < 24; i++) {
  //   yPoints.add(Offset((10.0), ((height) / 23) * i));
  // }

  for (var i = 0; i < timeLineValues.length; i++) {
    double x = (10 + ((width) / 7) * (timeLineValues[i].date.weekday - 1));
    double y = ((height) / 23 * (24 - timeLineValues[i].date.hour));
    points.add(Offset(x, y));
    if (i == 0) {
      path.moveTo(x, y);
    } else {
      double prevY = ((height) / 23 * (24 - timeLineValues[i - 1].date.hour));
      path.cubicTo(x - 15, prevY, x - 40, y, x, y);
    }
  }
  final paint = Paint()
    ..color = Colors.lightGreenAccent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;
  PathMetrics pathMetrics = path.computeMetrics();
  PathMetric pathMetric = pathMetrics.elementAt(0);
  Path extracted = pathMetric.extractPath(0.0, pathMetric.length * value);
  canvas.drawPath(
    extracted,
    paint,
  );
  canvas.drawPoints(
    PointMode.points,
    points,
    Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0,
    onTapDown: (details) {
      var timeLineValue = timeLineValues.firstWhere((element) =>
          (details.localPosition.dx >
                  (10 + ((width) / 7) * (element.date.weekday - 1)) - 5 &&
              details.localPosition.dx <
                  (10 + ((width) / 7) * (element.date.weekday - 1)) + 5) &&
          (details.localPosition.dy >
                  ((height) / 23 * (24 - element.date.hour)) - 5 &&
              details.localPosition.dy <
                  ((height) / 23 * (24 - element.date.hour)) + 5));
      showPopupMenu(context, details, timeLineValue);
    },
  );
  // canvas.drawPoints(
  //     PointMode.points,
  //     xPoints,
  //     Paint()
  //       ..color = Colors.blue
  //       ..style = PaintingStyle.stroke
  //       ..strokeCap = StrokeCap.round
  //       ..strokeWidth = 10.0);
  // canvas.drawPoints(
  //     PointMode.points,
  //     yPoints,
  //     Paint()
  //       ..color = Colors.white
  //       ..style = PaintingStyle.stroke
  //       ..strokeCap = StrokeCap.round
  //       ..strokeWidth = 10.0);

  return path;
}
