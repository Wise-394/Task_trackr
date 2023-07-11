import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogToDo extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String? initialText;

  const DialogToDo({
    Key? key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    this.initialText,
  }) : super(key: key);

  @override
  State<DialogToDo> createState() => _DialogToDoState();
}

class _DialogToDoState extends State<DialogToDo> {
  late String dialogTitle;
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.initialText ?? '';
    dialogTitle = widget.initialText != null ? 'Edit Task' : 'New Task';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget.controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter task here',
            ),
          ),
        ],
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
