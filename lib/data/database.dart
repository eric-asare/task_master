import 'package:hive/hive.dart';
import 'package:task_master/util/task_item_class.dart';

class Database {
  List taskList = [];
  final box = Hive.box("taskBox");

  void createInitialData() {
    taskList = [
      TaskItem("Do Laundry", false),
      TaskItem("Go Fishing", false),
      TaskItem("Hit the gym", false)
    ];
  }

  void readDB() {
    taskList = box.get('TASKLIST');
  }

  void updateDB(List tasklist) {
    box.put('TASKLIST', tasklist);
  }
}
