import 'package:flutter/material.dart';
import 'package:todo_app/ToDoTile.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const Center(
              child: Text('Your ToDo For Today'),
            ),
            ToDoTile(
              taskcompleted: false,
              onChanged: (p0) {},
            )
          ],
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
