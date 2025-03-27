import 'package:flutter/material.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/widgets/switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('settings')),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      body: const SwitchWidget(),
    );
  }
}
