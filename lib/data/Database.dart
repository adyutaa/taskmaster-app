import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List ToDo = [];

  // reference our Box
  final _mybox = Hive.box("mybox");

  // run this method if this is the 1st time opening the app

  void createInitialData() {
    ToDo = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the database
  void loadData() {
    ToDo = _mybox.get("TODOLIST");
  }

  // // update the database
  void updateDatabase() {
    _mybox.put("TODOLIST", ToDo);
  }
}
