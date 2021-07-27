// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../list_mode.dart';
//
// class Cards extends StatelessWidget {
//   IconData? iconData;
//   String? _genderText;
//   IconData? iconData2;
//
//   // Cards(String genderText, {IconData? iconData,IconData? iconData2}) {
//   //   this._genderText = genderText;
//   //   this._iconData = iconData;
//   //   this._iconData2 = iconData2;
//   // }
//   Cards(this._genderText, {this.iconData, this.iconData2});
//   var list = Lists();
//   @override
//   Widget build(BuildContext context) {
//     bool? active;
//     return Expanded(
//       child: Container(
//         color: Color(0xFF1D1E33),
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: active == true
//                   ? list.firstCondition(
//                       active, _genderText!, iconData!, iconData2!)
//                   : list.secondCondition(
//                       active, _genderText!, iconData!, iconData2!),
//             )),
//       ),
//     );
//   }
// }
