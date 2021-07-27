import 'package:bmi_calculator/Component/fontSize.dart';
import 'package:flutter/material.dart';

class ReusableBottomNavBar extends StatelessWidget {
  String _text;
  VoidCallback? onPressed;
  ReusableBottomNavBar(this._text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red,
      child: Container(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            _text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
