// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_master/data/database.dart';
import 'package:task_master/util/dialog_box.dart';
import 'package:task_master/util/task_item_class.dart';
import 'package:task_master/util/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box('taskBox');
  final db = Database();

  final _controller = TextEditingController();

  void checkboxChanged(index) {
    setState(() {
      db.taskList[index].toggleTaskCompletion();
    });
    db.updateDB(db.taskList);
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add(TaskItem(_controller.text, false));
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDB(db.taskList);
  }

  void deleteTask(index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDB(db.taskList);
  }

  void createNewTask() {
    // show a dialog box
    showDialog(
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
      context: context,
    );
  }

  @override
  void initState() {
    // create initial data if first time opening app
    if (box.get('TASKLIST') == null) {
      db.createInitialData();
    } else {
      db.readDB();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text("Task Master"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepOrange[200],
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: db.taskList.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskDescription: db.taskList[index].description,
              taskCompleted: db.taskList[index].isCompleted,
              onChanged: (value) => checkboxChanged(index),
              onDelete: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
