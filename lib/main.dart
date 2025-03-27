import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/cubits/task_cubit.dart';
import 'package:todo_app/data/hive_helper.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/settings_page.dart';
import 'package:todo_app/themes/themes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final taskBox = await HiveHelper.openBox('myBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemesProvider(),
      child: MyApp(myBox: taskBox),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Box<TaskModel> myBox;

  const MyApp({super.key, required this.myBox});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(myBox),
      child: MaterialApp(
        title: 'ToDo App',
        theme: Provider.of<ThemesProvider>(context).currentTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {'/settingsPage': (context) => const SettingsPage()},
      ),
    );
  }
}
