// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TaskTile({
    super.key,
    required this.taskDescription,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            autoClose: true,
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: ListTile(
          leading: Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          title: Text(
            taskDescription,
            style: TextStyle(
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
