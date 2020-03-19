import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBarWidget extends StatelessWidget {
  final int all, part;
  ProgressBarWidget({this.all, this.part});

  @override
  Widget build(BuildContext context) {
    return _buildProgressIndicator();
  }

  Widget _buildProgressIndicator() {
    final progress = part / all;

    return Row(
      children: <Widget>[
        Text(
          "${(progress * 100).round()}%",
          style: TextStyle(
            color: AppColors.green,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        LinearPercentIndicator(
          animation: true,
          lineHeight: 4,
          animationDuration: 2500,
          width: 100,
          percent: progress,
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: AppColors.background,
          progressColor: AppColors.green,
        ),
      ],
    );
  }
}
