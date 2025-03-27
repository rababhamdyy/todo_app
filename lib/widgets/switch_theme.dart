import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/cubits/locale_cubit.dart';
import 'package:todo_app/themes/themes_provider.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final localeCubit = context.watch<LocaleCubit>();

    return Column(
      children: [
        // Theme Switcher
        _buildSwitchTile(
          context,
          title: themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
          value: themeProvider.isDarkMode,
          onChanged: (value) => themeProvider.toggleTheme(),
        ),

        // Language Switcher
        _buildSwitchTile(
          context,
          title: localeCubit.state.languageCode == 'en' ? 'العربية' : 'English',
          value: localeCubit.state.languageCode == 'ar',
          onChanged: (value) {
            localeCubit.changeLocale(value ? 'ar' : 'en');
          },
        ),
      ],
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
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
                title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const Spacer(),
              Switch(
                value: value,
                onChanged: onChanged,
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
