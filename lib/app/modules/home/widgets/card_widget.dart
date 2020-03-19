import 'package:exportamais/app/models/lesson_model.dart';
import 'package:exportamais/app/modules/home/widgets/progress_bar_widget.dart';
import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';

class CardWidget extends StatelessWidget {
  final LessonModel lesson;

  CardWidget({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            offset: Offset(10, 10),
            color: Color.fromRGBO(34, 38, 36, 0.04),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProgressBarWidget(
            all: lesson.allLesson,
            part: lesson.finishedLesson,
          ),
          SizedBox(height: 15),
          Text(
            "${lesson.title}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey80,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "${lesson.description}",
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
}
