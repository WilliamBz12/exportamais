import 'package:exportamais/app/models/lesson_model.dart';
import 'package:exportamais/app/modules/home/widgets/progress_bar_widget.dart';
import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: 0,
            color: Color.fromRGBO(34, 38, 36, 0.08),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.lessonModel.image),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).maybePop();
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.only(top: 20, left: 16),
                      child: SvgPicture.asset('assets/images/chevron-left.svg'),
                    ),
                  ),
                ],
              ),
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
