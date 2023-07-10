import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  VoidCallback onPressed;
  SettingsPage({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onPressed, child: const Text('test'))
            ],
          ),
        ));
  }
}
