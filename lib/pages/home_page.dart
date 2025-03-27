import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/task_cubit.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = TextEditingController();

  void onCanceled(BuildContext context) {
    _controller.clear();
    Navigator.pop(context);
  }

  void onSaved(BuildContext context) {
    context.read<TaskCubit>().addTask(_controller.text);
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () => onSaved(context),
          onCancel: () => onCanceled(context),
          dialogLabelText: AppLocalizations.of(
            context,
          ).translate('add_new_task'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          AppLocalizations.of(context).translate('title'),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settingsPage');
            },
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
          createNewTask(context);
        },
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<TaskCubit, List<TaskModel>>(
        builder: (context, taskList) {
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                index: index,
                taskName: taskList[index].taskName,
                isCompleted: taskList[index].isCompleted,
                onChanged: (value) {
                  context.read<TaskCubit>().updateTask(index);
                },
                onDelete: () {
                  context.read<TaskCubit>().deleteTask(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
