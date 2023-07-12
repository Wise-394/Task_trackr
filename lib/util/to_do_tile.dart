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
              color: taskCompleted
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.primary,
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
                  shape: const CircleBorder(),
                  activeColor: Colors.black54,
                  value: taskCompleted,
                  onChanged: onChanged,
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Text(
                    softWrap: true,
                    taskName,
                    style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: taskCompleted
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .surfaceTint, // Background color
                  ),
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
