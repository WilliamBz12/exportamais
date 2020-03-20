import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemListWidget extends StatelessWidget {
  final String title;
  final bool state;
  final void Function() onTap;

  ItemListWidget({this.title, this.state = false, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.grey20,
            width: 1,
          ),
        ),
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(value: state, onChanged: (_) {}),
                SizedBox(width: 15),
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey80,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/images/chevron-right.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
