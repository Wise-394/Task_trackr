import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool taskcompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskcompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Checkbox(value: taskcompleted, onChanged: onChanged),
            const Text('Make This Thing Work'),
          ],
        ),
      ),
    );
  }
}
