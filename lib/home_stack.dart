import 'package:flutter/material.dart';
import 'package:todo_app/util/to_do_tile.dart';
import 'package:todo_app/util/dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/dbcode.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({
    super.key,
  });

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  //text controller
  final _controller = TextEditingController();

  //init db
  final _myBox = Hive.box('mybox');
  ToDoDB db = ToDoDB();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.initDB();
    } else {
      db.loadDB();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDB();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDB();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDB();
  }

  void viewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                onChanged: (value) => checkBoxChanged(value, index),
                taskCompleted: db.toDoList[index][1],
                deleteFunction: () => deleteTask(index),
                viewTask: () => viewTask(),
                newTask: false,
              );
            },
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              createNewTask();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
