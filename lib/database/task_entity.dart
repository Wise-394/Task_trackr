import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  bool checkMark;

  TaskEntity({
    required this.taskName,
    required this.checkMark,
  });
}
