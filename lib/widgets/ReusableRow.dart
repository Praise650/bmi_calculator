import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  VoidCallback? _iconDataSub;
  VoidCallback? _iconDataAdd;
  ReusableRow(
    VoidCallback iconDataSub,
    VoidCallback iconDataAdd,
  ) {
    this._iconDataSub = iconDataSub;
    this._iconDataAdd = iconDataAdd;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff4c4f5e),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: IconButton(
            onPressed: _iconDataSub,
            icon: Icon(Icons.remove),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff4c4f5e),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: IconButton(
            onPressed: _iconDataAdd,
            icon: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
