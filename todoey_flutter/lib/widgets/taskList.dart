import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/taskTile.dart';

class TaskList extends StatelessWidget {
  TaskList({this.taskList});
  final List<String> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        return TaskTile(task: taskList[index]);
      },
    );
  }
}
