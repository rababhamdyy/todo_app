import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/settings_page.dart';
import 'package:todo_app/themes/themes_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemesProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: Provider.of<ThemesProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {'/settingsPage': (context) => const SettingsPage()},
    );
  }
}
