import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task.dart';
import 'package:todoeyflutter/widgets/taskTile.dart';

class TaskList extends StatefulWidget {
  TaskList({this.taskList});
  final List<Task> taskList;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) {
        return TaskTile(
            task: widget.taskList[index].task,
            isChecked: widget.taskList[index].isDone,
            onChanged: (bool newValue) {
              setState(() {
                widget.taskList[index].toggleisDone();
              });
            });
      },
    );
  }
}
