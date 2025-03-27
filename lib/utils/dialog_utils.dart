import 'package:flutter/material.dart';

void confirmDelete(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Confirm Deletion"),
      content: Text("Are you sure you want to delete this task ?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cancel
          child: Text("Cancel", style: TextStyle(color: Colors.indigo[300])),
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // Execute deletion
            Navigator.pop(context); // Close the dialog
          },
          child: Text("Delete", style: TextStyle(color: Colors.indigo)),
        ),
      ],
    ),
  );
}
