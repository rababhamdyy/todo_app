import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/task_cubit.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/utils/dialog_utils.dart';
import 'package:todo_app/widgets/dialog_box.dart';

class TaskTile extends StatelessWidget {
  final int index;
  final Function(bool?)? onChanged;
  final String taskName;
  final bool isCompleted;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.index,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            leading: Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.indigo,
              checkColor: Colors.indigo[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(color: Colors.indigo, width: 2),
            ),
            title: Text(
              taskName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
                decorationColor: Colors.black,
              ),
            ),

            trailing: IconButton(
              onPressed: () => confirmDelete(context, onDelete),
              icon: Icon(Icons.delete, color: Colors.indigo),
            ),
            onTap: () {
              TextEditingController editController = TextEditingController(
                text: taskName,
              );

              showDialog(
                context: context,
                builder: (context) {
                  return DialogBox(
                    controller: editController,
                    onSave: () {
                      context.read<TaskCubit>().updateTaskName(
                        index,
                        editController.text,
                      );
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    dialogLabelText: AppLocalizations.of(
                      context,
                    ).translate('edit_task'),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
