// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_master/util/primary_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepOrange[200],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new task",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            OverflowBar(alignment: MainAxisAlignment.spaceEvenly, children: [
              PrimaryButton(name: 'Cancel', onPressed: onCancel),
              PrimaryButton(name: 'Save', onPressed: onSave),
            ])
            // Add two buttons: Save + Cancel
          ],
        ),
      ),
    );
  }
}
