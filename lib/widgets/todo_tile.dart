import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  Function(bool?)? onChanged;
  final String taskName;
  final bool isCompleted;
  final VoidCallback onDelete;

  TodoTile({
    super.key,
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
              ),
            ),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.indigo),
            ),
          ),
        ),
      ),
    );
  }
}
