import 'package:flutter/material.dart';
import 'classfiles/input_Page.dart';
import 'package:bmi_calculator/classfiles/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF9e9e9e),
        scaffoldBackgroundColor: Color(0xFFfafafa),
      ),
      home: InputPage(),
    );
  }
}
