import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile({super.key});
  Function(bool?)? onChanged;
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
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: onChanged),
              Text(
                "Task Name",
                style: TextStyle(color: Colors.black, fontSize: 20,decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
