import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/task_model.dart';

class TaskDatabase {
  final _myBox = Hive.box<TaskModel>('tasks');

  void addTask(TaskModel task) {
    _myBox.add(task);
  }

  List<TaskModel> getTasks() {
    return _myBox.values.toList();
  }

  void updateTask(int index, TaskModel task) {
    _myBox.putAt(index, task);
  }

  void deleteTask(int index) {
    _myBox.deleteAt(index);
  }
}