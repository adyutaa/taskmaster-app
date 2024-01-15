import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmaster_app/pages/todo_pages.dart';

void main() async {
  // initialize the hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
