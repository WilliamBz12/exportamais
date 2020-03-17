import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CardWidget extends StatelessWidget {
  final String title, description;
  final double progress;

  CardWidget({
    this.title,
    this.description,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildProgressIndicator(),
          SizedBox(height: 15),
          Text(
            "$title",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey80,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "$description",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grey80,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: <Widget>[
        Text(
          "${progress.round()}%",
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
          percent: progress / 100,
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: AppColors.background,
          progressColor: AppColors.green,
        ),
      ],
    );
  }
}
