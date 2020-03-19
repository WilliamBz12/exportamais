import 'package:exportamais/app/models/lesson_model.dart';
import 'package:exportamais/app/modules/home/widgets/progress_bar_widget.dart';
import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HeadWidget extends StatefulWidget {
  final LessonModel lessonModel;
  HeadWidget({this.lessonModel});

  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              widget.lessonModel.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildDescriptions(),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "${widget.lessonModel.finishedLesson}/"
              "${widget.lessonModel.allLesson} módulos",
              style: TextStyle(color: AppColors.grey50),
            ),
            SizedBox(width: 25),
            ProgressBarWidget(
              all: widget.lessonModel.allLesson,
              part: widget.lessonModel.finishedLesson,
            ),
          ],
        ),
        SizedBox(height: 25),
        Text(
          "${widget.lessonModel.title}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.grey80,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "${widget.lessonModel.description}",
          style: TextStyle(
            fontSize: 12,
            color: AppColors.grey60,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
