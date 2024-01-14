import 'package:flutter/material.dart';
import 'package:taskmaster_app/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // list of todo tasks
  List ToDo = [
    ["Attend GDSC Grand Meeting", false],
    ["Learn Flutter with Mitch", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDo[index][1] = !ToDo[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskMaster"),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple[200],
      body: ListView.builder(
        itemCount: ToDo.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: ToDo[index][0],
              taskCompleted: ToDo[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
      ),
    );
  }
}
