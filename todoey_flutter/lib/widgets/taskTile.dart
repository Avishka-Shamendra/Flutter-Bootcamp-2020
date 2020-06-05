import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.task, this.isChecked, this.onChanged});
  final String task;
  final bool isChecked;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
            fontSize: 22.5,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: onChanged,
      ),
    );
  }
}
