import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  Function(bool?)? onChanged;
  final String taskName;
  final bool isCompleted;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
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
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.indigo,
                checkColor: Colors.indigo[200],
                side: BorderSide(color: Colors.indigo, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration:
                      isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
