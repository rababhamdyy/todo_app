import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/task_model.dart';

class HiveHelper {
  static bool _initialized = false; 

  static Future<void> init() async {
    if (!_initialized) {
      await Hive.initFlutter();
      Hive.registerAdapter(TaskModelAdapter());
      _initialized = true;
    }
  }

  static Future<Box<TaskModel>> openBox(String boxName) async {
    await init();
    return await Hive.openBox<TaskModel>(boxName);
  }
}
