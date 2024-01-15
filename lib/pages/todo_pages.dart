import 'package:flutter/material.dart';
import 'package:taskmaster_app/util/dialog_box.dart';
import 'package:taskmaster_app/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // text controller
  final _controller = TextEditingController();

  //save new tasks

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

  void saveNewTasks() {
    setState(() {
      // save to Todo list
      ToDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // method to create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTasks,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskMaster"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
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
