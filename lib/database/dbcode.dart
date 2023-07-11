import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/task_entity.dart';

class ToDoDB {
  List<TaskEntity> toDoList = [];
  final _myBox = Hive.box('mybox');

  void initDB() {
    toDoList = [
      TaskEntity(taskName: "test", checkMark: false),
      TaskEntity(taskName: 'test2', checkMark: false)
    ];
  }

  void loadDB() {
    toDoList = _myBox.get("TODOLIST").cast<TaskEntity>();
  }

  void updateDB() {
    _myBox.put("TODOLIST", toDoList);
  }
}
