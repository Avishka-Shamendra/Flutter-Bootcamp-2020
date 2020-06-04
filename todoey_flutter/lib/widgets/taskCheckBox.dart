import 'package:flutter/material.dart';

class TaskCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function toggleCheckBox;
  TaskCheckBox({this.isChecked, this.toggleCheckBox});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckBox);
  }
}
