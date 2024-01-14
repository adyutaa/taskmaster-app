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
      padding: const EdgeInsets.all(25.0),
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
            BoxShadow(
              color: Colors.black,
              spreadRadius: 3.2,
              offset: Offset(3.2, 7),

            )
          ]
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black87,),
            Text(taskName),
          ],
        ),
      ),
    );
  }
}
