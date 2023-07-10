import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogToDo extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogToDo(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  State<DialogToDo> createState() => _DialogToDoState();
}

class _DialogToDoState extends State<DialogToDo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Task'),
      content: Card(
        shape: const RoundedRectangleBorder(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'enter task here')),
        ]),
      ),
      actions: <Widget>[
        BtnPrototype(
          btnAction: widget.onCancel,
          btnText: 'Cancel',
        ),
        BtnPrototype(
          btnAction: widget.onSave,
          btnText: 'Save',
        ),
      ],
    );
  }
}
