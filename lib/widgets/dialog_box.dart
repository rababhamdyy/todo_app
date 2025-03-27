import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final String dialogLabelText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.dialogLabelText,
    required this.onSave,
    required this.onCancel,
  });

  final _formKey = GlobalKey<FormState>();
  //add padding to the dialog box
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: dialogLabelText,
            floatingLabelStyle: TextStyle(color: Colors.indigo),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.indigo),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a task';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                onCancel();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  onSave();
                }
              },
              child: const Text('Save', style: TextStyle(color: Colors.indigo)),
            ),
          ],
        ),
      ],
    );
  }
}
