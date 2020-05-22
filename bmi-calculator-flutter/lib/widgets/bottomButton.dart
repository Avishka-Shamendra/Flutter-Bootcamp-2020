import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.label});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kCalculateButtonStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 15),
        color: kActiveButtonColor,
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
