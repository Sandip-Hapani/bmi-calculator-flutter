import 'dart:ui';
import 'package:bmi_calculator/element/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/element/bottom_button.dart';
import 'package:bmi_calculator/element/new_container.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calulator'),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Your BMI Result',
                    style: kTitleResultTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: NewContainer(
                Colour: kActiveCardColour,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: kBMIResultTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: bottomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                text: 'RE-CALCULATE',
              ),
            ),
          ],
        ),
    );
  }
}
