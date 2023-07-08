import 'package:flutter/material.dart';
import 'package:todo_app/util/to_do_tile.dart';
import 'package:todo_app/util/dialog.dart';

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

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  List toDoList = [
    ["make this listview work", false],
    ["add new task", false],
  ];

  //method to create task
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
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                onChanged: (value) => checkBoxChanged(value, index),
                taskCompleted: toDoList[index][1],
                deleteFunction: () => deleteTask(index),
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
