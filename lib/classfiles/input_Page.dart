import 'package:bmi_calculator/element/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/element/icon_content.dart';
import 'result_page.dart';
import 'package:bmi_calculator/element/new_container.dart';
import 'package:bmi_calculator/element/bottom_button.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectgender;
  int height = 180;
  int weight = 50;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewContainer(
                    onPress: () {
                      setState(() {
                        selectgender = Gender.male;
                      });
                    },
                    // CardChild: NewIcon(
                    //   icon: FontAwesomeIcons.mars,
                    //
                    //   IconText: 'MALE',
                    // ),
                    CardChild: Column(
                      children: [
                        Expanded(flex: 5,child: Image.asset('image/male.png',height: 130.0, width: 130.0)),
                        Expanded(flex: 1,child: Text('MALE'))
                      ],
                    ),
                    Colour: selectgender == Gender.male
                        ? kInactiveCardColour
                        : kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: NewContainer(
                    onPress: () {
                      setState(() {
                        selectgender = Gender.female;
                      });
                    },
                    // CardChild: NewIcon(
                    //   IconText: 'FEMALE',
                    //   icon: FontAwesomeIcons.venus,
                    // ),
                    CardChild: Column(
                      children: [
                        Expanded(flex: 5,child: Image.asset('image/female.png',height: 130.0,width: 130.0)),
                        Expanded(flex: 1,child: Text('FEMALE')),
                      ],
                    ),
                    Colour: selectgender == Gender.female
                        ? kInactiveCardColour
                        : kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewContainer(
                    Colour: kActiveCardColour,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xFF000000),
                                ),
                                backgroundColor: Color(0xFFbdbdbd)),
                            SizedBox(width: 20.0),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF000000),
                                ),
                                backgroundColor: Color(0xFFbdbdbd),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NewContainer(
                    Colour: kActiveCardColour,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text('$age', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xFF000000),
                                ),
                                backgroundColor: Color(0xFFbdbdbd)),
                            SizedBox(width: 20.0),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF000000),
                                ),
                                backgroundColor: Color(0xFFbdbdbd)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewContainer(
              Colour: kActiveCardColour,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      inactiveTrackColor: Color(0xFFFFFFFF),
                      activeTrackColor: Colors.black,
                      thumbColor: Colors.black,
                      overlayColor: Color(0X29000000),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinValue,
                      max: kMaxValue,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
            child: bottomButton(
              onPress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.CalculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE',
            ),
          ),
          // FloatingActionButton(
          //   backgroundColor: Colors.black,
          // ),
        ],
      ),
    );
  }
}
