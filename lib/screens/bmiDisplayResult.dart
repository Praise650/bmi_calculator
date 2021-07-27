import 'package:bmi_calculator/Component/colors.dart';
import 'package:bmi_calculator/Component/fontSize.dart';
import 'package:bmi_calculator/widgets/ReusableCard.dart';
import 'package:bmi_calculator/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  String getResult;
  String getToString;
  String _displayResult;
  DisplayResult(this._displayResult, this.getResult, this.getToString);
  List<String> _list = [
    'You have a higher than normal \n body weight. Try to exercise more.',
    'You have a higher than normal \n body weight. Try to exercise more.'
  ];
  @override
  Widget build(BuildContext context) {
    // String show = _list.add(
    //     'You have a higher than normal \n body weight. Try to exercise more.');
    // final show2 = _list.add(
    //     'You have a higher than normal \n body weight. Try to exercise more.');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Your Result',
                style: largeTextStyle,
              ),
            ),
            ReusableCard(
              flex: 5,
              color: Colours.reusableCardColor,
              customizable: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResult.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '$_displayResult',
                    style: largeTextStyle,
                  ),
                  Container(
                    child: Text(
                      '$getToString',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ReusableBottomNavBar(
        'RE-CALCULATE',
        () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
