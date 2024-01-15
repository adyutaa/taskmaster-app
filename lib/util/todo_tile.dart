// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;


  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.orangeAccent.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            style: BorderStyle.solid
          ),
          boxShadow: [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: Colors.black,
              spreadRadius: 3.2,
              // ignore: prefer_const_constructors
              offset: Offset(3.2, 7),

            )
          ]
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black87,),
            Text(taskName,
            style: TextStyle(
            decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
