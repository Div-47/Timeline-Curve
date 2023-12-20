import 'package:flutter/material.dart';
import 'package:timeline_curve/helpers/time_format.dart';
import 'package:timeline_curve/models/TimeLineModel.dart';

showPopupMenu(
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
