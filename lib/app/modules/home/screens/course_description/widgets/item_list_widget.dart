import 'package:exportamais/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final String title;
  final bool state;

  ItemListWidget({this.title, this.state = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
