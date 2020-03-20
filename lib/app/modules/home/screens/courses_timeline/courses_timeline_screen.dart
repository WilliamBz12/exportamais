import 'package:exportamais/app/models/lesson_model.dart';
import 'package:exportamais/app/modules/home/widgets/card_widget.dart';
import 'package:exportamais/app/modules/home/widgets/timeline_widget.dart';
import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CoursesTimelineScreen extends StatefulWidget {
  @override
  _CoursesTimelineScreenState createState() => _CoursesTimelineScreenState();
}

class _CoursesTimelineScreenState extends State<CoursesTimelineScreen> {
  List<LessonModel> lessons = [
    LessonModel(
      allLesson: 5,
      finishedLesson: 2,
      description: "Antes de exportar os seus produtos, "
          "você deve conhecer o mercado onde deseja atuar.",
      image: "assets/wallpaper.png",
      title: "O exportador iniciante",
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey10,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildHead(),
            Expanded(
              child: TimelineWidget(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: [
                  InkWell(
                    child: CardWidget(lesson: lessons[0]),
                    onTap: () => Navigator.pushNamed(context, "/course",
                        arguments: lessons[0]),
                  ),
                  CardWidget(lesson: lessons[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHead() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          Text(
            "O caminho da exportação",
            style: TextStyle(
              color: AppColors.grey90,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Vamos ajudar a sua empresa a exportar\nde forma correta e simplificada.",
            style: TextStyle(
              color: AppColors.grey60,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}