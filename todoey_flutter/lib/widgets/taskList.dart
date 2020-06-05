import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/taskData.dart';
import 'package:todoeyflutter/widgets/taskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.getTodoCount(),
          itemBuilder: (context, index) {
            final currentTask = taskData.todos[index];
            return TaskTile(
              task: currentTask.task,
              isChecked: currentTask.isDone,
              onChanged: (newValue) {
                taskData.updateTask(currentTask);
              },
              onLongPress: () {
                taskData.deleteTask(currentTask);
              },
            );
          },
        );
      },
    );
  }
}
