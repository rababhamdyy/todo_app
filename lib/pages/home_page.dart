import 'package:flutter/material.dart';
import 'package:todo_app/data/task_database.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var taskDatabase = TaskDatabase();
  List<TaskModel> taskList = [];

  @override
  void initState() {
    taskList = taskDatabase.getTasks();
    super.initState();
  }

  final _controller = TextEditingController();
  void onCanceled() {
    _controller.clear();
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      var newTask = TaskModel(taskName: _controller.text, isCompleted: false);
      taskList.add(newTask);
      taskDatabase.addTask(newTask);
    });
    _controller.clear();
    Navigator.pop(context);
  }

  void updateTask(int index, TaskModel task) {
    setState(() {
      taskList[index].isCompleted = !taskList[index].isCompleted;
      taskDatabase.updateTask(index, taskList[index]);
    });
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
      taskDatabase.deleteTask(index);
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onSaved,
          onCancel: onCanceled,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("ToDo App", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(90),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: taskList[index].taskName,
            isCompleted: taskList[index].isCompleted,
            onChanged: (value) {
              updateTask(index, taskList[index]);
            },
            onDelete: () {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
