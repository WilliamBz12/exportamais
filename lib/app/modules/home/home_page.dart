import 'dart:ui';

import 'package:exportamais/app/modules/home/widgets/card_widget.dart';
import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TimelineModel> items = [
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 80,
      ),
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.blur_circular),
    ),
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 0,
      ),
      iconBackground: AppColors.blue,
      icon: Icon(Icons.blur_circular),
    ),
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 0,
      ),
      iconBackground: AppColors.blue,
      icon: Icon(Icons.blur_circular),
    ),
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 80,
      ),
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.blur_circular),
    ),
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 0,
      ),
      iconBackground: AppColors.blue,
      icon: Icon(Icons.blur_circular),
    ),
    TimelineModel(
      CardWidget(
        title: "O Exportador iniciante",
        description: "Antes de exportar os seus produtos, "
            "você deve conhecer o mercado onde deseja atuar.",
        progress: 0,
      ),
      iconBackground: AppColors.blue,
      icon: Icon(Icons.blur_circular),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreen,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/info.svg",
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/person.svg"),
              title: Text(""),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: AppColors.green,
          elevation: 0,
          child: SvgPicture.asset("assets/images/logo-flat.svg"),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildHead(),
            Expanded(
              child: Timeline(
                children: items,
                position: TimelinePosition.Left,
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
