import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void initDB() {
    toDoList = [
      ["Your Task is empty", false],
      ["Make a new task", false],
    ];
  }

  void loadDB() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDB() {
    _myBox.put("TODOLIST", toDoList);
  }
}
