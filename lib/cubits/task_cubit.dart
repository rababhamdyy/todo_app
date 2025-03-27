import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/task_model.dart';

class TaskCubit extends Cubit<List<TaskModel>> {
  final Box<TaskModel> _myBox;

  TaskCubit(this._myBox) : super([]) {
    getTasks();
  }

  void getTasks() {
    if (_myBox.isNotEmpty) {
      emit(_myBox.values.toList());
    }
  }

  void addTask(String task) {
    final newTask = TaskModel(taskName: task, isCompleted: false);
    _myBox.add(newTask);
    emit([...state, newTask]);
  }

  void updateTask(int index) {
    state[index].isCompleted = !state[index].isCompleted;
    _myBox.putAt(index, state[index]);
    emit([...state]);
  }

  void deleteTask(int index) {
    _myBox.deleteAt(index);
    emit([...state]..removeAt(index));
  }
}
