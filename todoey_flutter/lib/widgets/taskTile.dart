import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/taskCheckBox.dart';

class TaskTile extends StatefulWidget {
  TaskTile({this.task});
  final String task;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task,
        style: TextStyle(
            fontSize: 22.5,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        isChecked: isChecked,
        toggleCheckBox: (bool newValue) {
          setState(() {
            isChecked = newValue;
          });
        },
      ),
    );
  }
}
