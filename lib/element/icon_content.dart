import 'constant.dart';
import 'package:flutter/material.dart';


class NewIcon extends StatelessWidget {
  NewIcon({this.IconText, this.icon});
  final String IconText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Color(0xFF000000), size: 80.0),
        SizedBox(height: 15.0),
        Text(
          IconText,
          style:kLabelTextStyle
          ),
      ],
    );
  }
}
