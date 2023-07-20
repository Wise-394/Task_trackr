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
            color: Theme.of(context).colorScheme.surface,
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
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: taskCompleted,
                    onChanged: onChanged,
                  ),
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      softWrap: true,
                      taskName,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        //color: Theme.of(context).colorScheme.primary,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                  onPressed: deleteFunction,
                  child: const Row(
                    children: [
                      Icon(Icons.delete),
                      //Text("Delete"),
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
