import 'package:flutter/material.dart';
import 'package:todo_app/database/sharedpref.dart';
import 'package:todo_app/util/to_do_tile.dart';
import 'package:todo_app/util/dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/dbcode.dart';
import 'package:todo_app/database/task_entity.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  // Text controller
  final _controller = TextEditingController();

  bool isEditing = false;
  int editedTaskIndex = -1;

  void editTask() {
    setState(() {
      isEditing = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: updateTask,
          onCancel: () {
            setState(() {
              isEditing = false;
            });
            Navigator.of(context).pop();
          },
          initialText: db
              .toDoList[editedTaskIndex].taskName, // Pass the initial task text
        );
      },
    );
  }

  void updateTask() {
    setState(() {
      db.toDoList[editedTaskIndex].taskName = _controller.text;
      isEditing = false;
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDB();
  }

  // Init db
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
      db.toDoList[index].checkMark = !db.toDoList[index].checkMark;
    });
    db.updateDB();
  }

  void createNewTask() {
    showDialog(
      barrierDismissible: false,
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
      db.toDoList.add(TaskEntity(taskName: _controller.text, checkMark: false));
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
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DialogToDo(
          controller: _controller,
          onSave: updateTask,
          onCancel: () => Navigator.of(context).pop(),
          initialText: db
              .toDoList[editedTaskIndex].taskName, // Pass the initial task text
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int uncompletedCount = db.getUncompleteTask();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    uncompletedCount != 0
                        ? "Welcome! you have $uncompletedCount uncomplete task today"
                        : "You currently have no task to complete!",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Scaffold(
                body: ListView.builder(
                  itemCount: db.toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskName: db.toDoList[index].taskName,
                      onChanged: (value) => checkBoxChanged(value, index),
                      taskCompleted: db.toDoList[index].checkMark,
                      deleteFunction: () => deleteTask(index),
                      editTask: () {
                        setState(() {
                          editedTaskIndex = index;
                        });
                        viewTask();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: createNewTask,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
