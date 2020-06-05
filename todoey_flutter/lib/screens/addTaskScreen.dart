import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/constnats.dart';
import 'package:todoeyflutter/models/taskData.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: kContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 15, 40, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  newTask = value;
                },
                textAlign: TextAlign.center,
                autofocus: true,
                style: TextStyle(fontSize: 22.5),
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (newTask != null) {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTask);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
