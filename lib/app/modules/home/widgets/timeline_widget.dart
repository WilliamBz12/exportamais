import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TimelineWidget extends StatelessWidget {
  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget> indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  const TimelineWidget({
    @required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 16.0,
    this.gutterSpacing = 16.0,
    this.padding = const EdgeInsets.all(16),
    this.controller,
    this.lineColor = AppColors.grey40,
    this.physics,
    this.shrinkWrap = false,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 32.0,
    this.indicatorColor = AppColors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];

        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            painter: _TimelinePainter(
              lineColor: lineColor,
              indicatorSize: indicatorSize,
              isLast: isLast,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
            ),
            child: Container(
              height: double.infinity,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 7),
              width: indicatorSize,
              child: Container(
                height: indicatorSize,
                width: indicatorSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: indicatorColor,
                ),
                child: Text(
                  "${index + 1}",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        List<Widget> timelineChildren;

        if (isLeftAligned) {
          timelineChildren = timelineTile;
        } else {
          timelineChildren = timelineTile.reversed.toList();
        }
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: timelineChildren,
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  final double indicatorSize;
  final Paint linePaint;
  final bool isLast;

  _TimelinePainter({
    @required StrokeCap strokeCap,
    @required double strokeWidth,
    @required PaintingStyle style,
    @required Color lineColor,
    @required this.indicatorSize,
    @required this.isLast,
  }) : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    var dashWidth = 5;
    var dashSpace = 5;
    double max = size.height;
    double startY = indicatorRadius + 27;

    if (!isLast) {
      while (max >= 0) {
        canvas.drawLine(
          Offset(indicatorRadius, startY),
          Offset(indicatorRadius, startY + dashWidth),
          linePaint,
        );
        final space = (dashSpace + dashWidth);
        startY += space;
        max -= space;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
