import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const lessonText =
    "Vestibulum convallis ac scelerisque dis nulla id donec tellus non. "
    "Commodo cursus tortor amet, ut in dolor. Ornare diam sit amet "
    "sit cursus rhoncus venenatis, risus. Donec maecenas sit tortor "
    "mattis mattis molestie sagittis lacus mi. Sapien enim dictum "
    "ac orci, egestas sapien, eu, mauris.";

class LessonScreen extends StatefulWidget {
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Conhecendo o mercado",
          style: TextStyle(
            color: AppColors.grey80,
            fontSize: 16,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: Container(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/images/chevron-left.svg',
              color: AppColors.grey80,
            ),
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              lessonText,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.8),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Row(
          children: <Widget>[
            if (currentPage > 0)
              Expanded(
                child: _buildContinueButton(isBack: true),
              ),
            if (currentPage < 4)
              Expanded(
                child: _buildContinueButton(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton({bool isBack = false}) {
    return Material(
      color: isBack ? AppColors.grey10 : AppColors.green,
      elevation: 0,
      child: InkWell(
        onTap: () {
          if (isBack) {
            setState(() {
              pageController.animateToPage(
                currentPage - 1,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
              currentPage -= 1;
            });
          } else {
            setState(() {
              pageController.animateToPage(
                currentPage + 1,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
              currentPage += 1;
            });
          }
        },
        child: Container(
          height: 48,
          padding: EdgeInsets.all(14),
          alignment: Alignment.center,
          child: Text(
            isBack ? "Voltar" : "Continuar",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isBack ? AppColors.grey90 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
