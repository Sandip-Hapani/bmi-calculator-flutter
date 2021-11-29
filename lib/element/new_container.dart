import 'package:flutter/material.dart';

class NewContainer extends StatelessWidget {

  NewContainer(
      {@required this.Colour, this.CardChild, IconData icon, this.onPress, this.imageLoad});
  final Color Colour;
  final Widget CardChild;
  final Function onPress;
  final Widget imageLoad;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colour,
        ),
      ),
    );
  }
}