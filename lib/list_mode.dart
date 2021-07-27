import 'package:flutter/material.dart';

class Lists {
  firstCondition(var active, String text, IconData _iconData) {
    active = true;
    List<Widget> list1 = [
      Icon(_iconData),
      Text(text),
    ];

    return Column(
      children: list1,
    );
  }

  secondCondition(var active, String text, IconData _iconData) {
    active = false;
    List<Widget> list2 = [
      Text(text),
      Text(text),
      Icon(_iconData),
      Icon(_iconData),
    ];

    return Column(
      children: list2,
    );
  }
}
