import 'package:flutter/material.dart';
import 'package:todo_app/util/to_do_tile.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({
    super.key,
  });

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  List toDoList = [
    ["make this work", false],
    ["aaaaaaaaaaaaaaa", true],
    ["aaaaaaaaaaaaaaa", true],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
    ["make this work", false],
  ];

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
                  taskCompleted: toDoList[index][1]);
            },
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              print("yay");
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
