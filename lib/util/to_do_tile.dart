import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool taskCompleted;
  final String taskName;
  Function(bool?)? onChanged;
  VoidCallback deleteFunction;
  //

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.onChanged,
      required this.taskCompleted,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: InkWell(
        onTap: () {
          print('yay');
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: taskCompleted ? Colors.blue[600] : Colors.blue,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              const Spacer(),
              const Icon(
                Icons.drive_file_rename_outline,
                color: Colors.white70,
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: deleteFunction, child: const Text('delete'))
            ],
          ),
        ),
      ),
    );
  }
}
