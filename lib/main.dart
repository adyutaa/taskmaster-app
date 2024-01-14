import 'package:flutter/material.dart';
import 'package:taskmaster_app/pages/todo_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
