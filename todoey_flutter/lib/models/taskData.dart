import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _todos = [];

  UnmodifiableListView<Task> get todos {
    return UnmodifiableListView(_todos);
  }

  int getTodoCount() {
    return _todos.length;
  }

  void addTask(String taskText) {
    _todos.add(Task(task: taskText));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleisDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _todos.remove(task);
    notifyListeners();
  }
}
