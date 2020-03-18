import 'dart:ui';

import 'package:exportamais/app/modules/home/widgets/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/themes/app_colors.dart';
import 'widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey10,
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
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
        margin: EdgeInsets.only(top: 45),
        height: 64,
        width: 64,
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
              child: TimelineWidget(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: [
                  CardWidget(
                    title: "O Exportador iniciante",
                    description: "Antes de exportar os seus produtos, "
                        "você deve conhecer o mercado onde deseja atuar.",
                    progress: 80,
                  ),
                  CardWidget(
                    title: "O Exportador iniciante",
                    description: "Antes de exportar os seus produtos, "
                        "você deve conhecer o mercado onde deseja atuar.",
                    progress: 0,
                  ),
                  CardWidget(
                    title: "O Exportador iniciante",
                    description: "Antes de exportar os seus produtos, "
                        "você deve conhecer o mercado onde deseja atuar.",
                    progress: 30,
                  ),
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
