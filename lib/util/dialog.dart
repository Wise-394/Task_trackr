import 'package:flutter/material.dart';

class DialogToDo extends StatelessWidget {
  const DialogToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('ToDO'),
      content: Column(children: [TextField()]),
    );
  }
}
