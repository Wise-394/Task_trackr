import 'package:flutter/material.dart';

class home_stack extends StatelessWidget {
  const home_stack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [
            Center(
              child: Text('Welcome to To-do app'),
            ),
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
