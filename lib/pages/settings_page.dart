import 'package:flutter/material.dart';
import 'package:todo_app/widgets/switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      body: SwitchWidget(),
    );
  }
}
