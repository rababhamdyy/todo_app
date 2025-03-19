import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  bool isCompleted;

  TaskModel({
    required this.taskName,
    required this.isCompleted,
  });
}