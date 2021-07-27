import 'package:bmi_calculator/Component/colors.dart';
import 'package:bmi_calculator/Component/fontSize.dart';
import 'package:bmi_calculator/Functions/calculate.dart';
import 'package:bmi_calculator/enums/gender.dart';
import 'package:bmi_calculator/screens/bmiDisplayResult.dart';
import 'package:bmi_calculator/widgets/ReusableCard.dart';
import 'package:bmi_calculator/widgets/ReusableRow.dart';
import 'package:bmi_calculator/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 60;
  int age = 19;
  int _height = 180;
  Color maleColor = Colours.maleColorInactive;
  Color femaleColor = Colours.maleColorInactive;
  Gender? selectedGender;
  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleColor == Colours.maleColorInactive) {
        maleColor = Colours.maleColor;
        femaleColor = Colours.femaleColorInactive;
      } else {
        maleColor = Colours.maleColorInactive;
      }
    } else {
      if (femaleColor == Colours.femaleColorInactive) {
        femaleColor = Colours.femaleColor;
        maleColor = Colours.maleColorInactive;
      } else {
        femaleColor = Colours.femaleColorInactive;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  flex: 1,
                  color: maleColor,
                  onTap: () {
                    setState(() {
                      updateColour(Gender.male);
                    });
                  },
                  customizable: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      Text(
                        getGender(Gender.male).toUpperCase(),
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  flex: 1,
                  color: femaleColor,
                  onTap: () {
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                  customizable: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      Text(
                        getGender(Gender.female).toUpperCase(),
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            flex: 1,
            color: Colours.reusableCardColor,
            customizable: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HEIGHT',
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$_height',
                      style: largeTextStyle,
                    ),
                    Text(
                      'CM',
                      style: textStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colours.textColor,
                    activeTrackColor: Colours.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
                  ),
                  child: Slider(
                    onChanged: (double range) {
                      setState(() {
                        _height = range.round();
                      });
                    },
                    onChangeStart: (double start) {
                      setState(() {
                        _height = start.round();
                      });
                    },
                    onChangeEnd: (double end) {
                      setState(() {
                        _height = end.round();
                      });
                    },
                    value: _height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  flex: 1,
                  color: Colours.reusableCardColor,
                  customizable: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'WEIGHT',
                        style: textStyle,
                      ),
                      Text(
                        '$weight',
                        style: largeTextStyle,
                      ),
                      ReusableRow(
                        () {
                          setState(() {
                            weight == 1 ? weight = 1 : weight--;
                          });
                        },
                        () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  flex: 1,
                  color: Colours.reusableCardColor,
                  customizable: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'AGE',
                        style: textStyle,
                      ),
                      Text(
                        '$age',
                        style: largeTextStyle,
                      ),
                      ReusableRow(
                        () {
                          setState(() {
                            age == 1 ? age = 1 : age--;
                          });
                        },
                        () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: ReusableBottomNavBar(
        'CALCULATE',
        () {
          Calculator calculator = Calculator(_height, weight);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayResult(
                calculator.calculateBMI(),
                calculator.getResult(),
                calculator.getToString(),
              ),
            ),
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
