import 'package:exportamais/app/modules/home/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/lesson_model.dart';
import '../../shared/themes/app_colors.dart';
import 'screens/courses_timeline/courses_timeline_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  bool busy = true;

  @override
  void initState() {
    super.initState();
    _firstLoad();
  }

  void _firstLoad() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    if (busy) return SplashScreen();
    
    return Scaffold(
      backgroundColor: AppColors.grey10,
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
      body: PageView(
        children: <Widget>[
          RouterOutlet(module: CoursesTimelineModule()),
        ],
      ),
    );
  }
}
