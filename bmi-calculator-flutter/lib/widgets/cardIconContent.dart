import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CardIconContent extends StatelessWidget {
  CardIconContent({this.iconData, this.label});
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label, style: kTextStyle)
      ],
    );
  }
}
