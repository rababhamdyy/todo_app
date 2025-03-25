import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/themes/themes_provider.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Text(
                themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
                style: TextStyle(fontSize: 20,color: Colors.black),
              ),
              Spacer(),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
                activeColor: Colors.indigo,
                activeTrackColor: Colors.indigo[300],
                inactiveThumbColor: Colors.indigo,
                inactiveTrackColor: Colors.indigo[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}