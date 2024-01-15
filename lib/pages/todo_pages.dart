import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmaster_app/data/Database.dart';
import 'package:taskmaster_app/util/dialog_box.dart';
import 'package:taskmaster_app/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // reference the box
  final _myBox = Hive.box('mybox');
  // instantiate Database
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // init method if this is the first time opening the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // if user has already opening the app and have some sessions, load them data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  //save new tasks

  // list of todo tasks
  // List ToDo = [
  //   ["Attend GDSC Grand Meeting", false],
  //   ["Learn Flutter with Mitch", false],
  //

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDo[index][1] = !db.ToDo[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTasks() {
    setState(() {
      // save to Todo list
      db.ToDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
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

  // delete task

  void deleteTask(int index) {
    setState(() {
      db.ToDo.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskMaster"),
        elevation: 0,
        backgroundColor: Colors.red.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.red.shade400,
      body: ListView.builder(
        itemCount: db.ToDo.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.ToDo[index][0],
            taskCompleted: db.ToDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
