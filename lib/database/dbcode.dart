import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_trackr/database/task_entity.dart';

class ToDoDB {
  List<TaskEntity> toDoList = [];
  List<TaskEntity> toDoListCompleted = [];
  List<TaskEntity> toDoListUncomplete = [];
  final _myBox = Hive.box('mybox');

  void initDB() {
    toDoList = [
      TaskEntity(taskName: "Your task is empty", checkMark: false),
      TaskEntity(taskName: 'Add a new task', checkMark: false)
    ];
  }

  void loadDB() {
    toDoList = _myBox.get("TODOLIST").cast<TaskEntity>();
  }

  void updateDB() {
    _myBox.put("TODOLIST", toDoList);
  }

  int getUncompleteTask() {
    int uncompleteTask = 0;
    for (int i = 0; i < toDoList.length; i++) {
      if (!toDoList[i].checkMark) {
        uncompleteTask++;
      }
    }
    return uncompleteTask;
  }

  List<TaskEntity> getCompletedTasks() {
    return toDoList.where((task) => task.checkMark).toList();
  }

  List<TaskEntity> getUncompletedTasks() {
    return toDoList.where((task) => !task.checkMark).toList();
  }
}
