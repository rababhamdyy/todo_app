import 'package:flutter/material.dart';
import 'package:todo_app/l10n/app_localizations.dart';

void confirmDelete(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context).translate('confirm_deletion'),
          ),
          content: Text(
            AppLocalizations.of(context).translate('delete_task_confirmation'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel
              child: Text(
                AppLocalizations.of(context).translate('cancel'),
                style: TextStyle(color: Colors.indigo[300]),
              ),
            ),
            TextButton(
              onPressed: () {
                onConfirm(); // Execute deletion
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                AppLocalizations.of(context).translate('delete'),
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        ),
  );
}
