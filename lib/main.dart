import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/cubits/locale_cubit.dart';
import 'package:todo_app/cubits/task_cubit.dart';
import 'package:todo_app/data/hive_helper.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/settings_page.dart';
import 'package:todo_app/themes/themes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final taskBox = await HiveHelper.openBox<TaskModel>('myBox');

  final settingsBox = await HiveHelper.openBox<String>('settingsBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
        BlocProvider(create: (context) => TaskCubit(taskBox)),
        BlocProvider(create: (context) => LocaleCubit(settingsBox)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          title: 'ToDo App',
          theme: Provider.of<ThemesProvider>(context).currentTheme,
          debugShowCheckedModeBanner: false,

          supportedLocales: const [Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,

          home: HomePage(),
          routes: {'/settingsPage': (context) => const SettingsPage()},
        );
      },
    );
  }
}
