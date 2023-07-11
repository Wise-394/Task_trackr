import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool taskCompleted;
  final String taskName;
  final Function(bool?)? onChanged;
  final VoidCallback deleteFunction;
  final VoidCallback editTask;

  const ToDoTile({
    Key? key,
    required this.taskName,
    required this.onChanged,
    required this.taskCompleted,
    required this.deleteFunction,
    required this.editTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: InkWell(
        onTap: editTask,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Checkbox(
                  activeColor: Colors.black54,
                  value: taskCompleted,
                  onChanged: onChanged,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: deleteFunction,
                  child: const Row(
                    children: [
                      Icon(Icons.delete),
                      Text("Delete"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
