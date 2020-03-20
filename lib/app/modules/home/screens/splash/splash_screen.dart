import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green,
      child: Center(
        child: SvgPicture.asset('assets/images/logo.svg'),
      ),
    );
  }
}
