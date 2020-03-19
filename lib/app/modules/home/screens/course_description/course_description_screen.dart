import 'package:exportamais/app/models/lesson_model.dart';
import 'package:exportamais/app/modules/home/screens/course_description/widgets/head_widget.dart';
import 'package:exportamais/app/modules/home/screens/course_description/widgets/item_list_widget.dart';
import 'package:flutter/material.dart';

class CourseDescriptionScreen extends StatefulWidget {
  final LessonModel lesson;
  CourseDescriptionScreen({this.lesson});
  @override
  _CourseDescriptionScreenState createState() =>
      _CourseDescriptionScreenState();
}

class _CourseDescriptionScreenState extends State<CourseDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeadWidget(lessonModel: widget.lesson),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      child: Column(
        children: <Widget>[
          ItemListWidget(
            state: true,
            title: "Conhecendo o mercado",
          ),
          ItemListWidget(
            state: true,
            title: "Conhecendo o mercado",
          ),
          ItemListWidget(
            state: false,
            title: "Conhecendo o mercado",
          )
        ],
      ),
    );
  }
}
