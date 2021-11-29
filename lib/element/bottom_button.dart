import 'package:flutter/material.dart';
import 'constant.dart';

class bottomButton extends StatelessWidget {
  bottomButton({this.onPress, this.text});
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        child: Center(child: Text(text, style: kLargeButtonTextStyle,)),
      ),
    );
  }
}