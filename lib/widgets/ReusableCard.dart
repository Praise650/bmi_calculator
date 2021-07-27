import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  Color? color;
  Widget? customizable;
  VoidCallback? onTap;
  var flex = 1;

  ReusableCard({this.customizable, this.color, this.onTap, required this.flex});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardContent(customizable),
          ),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  Widget? customizable;
  CardContent(this.customizable);
  @override
  Widget build(BuildContext context) {
    return Container(child: customizable);
  }
}
