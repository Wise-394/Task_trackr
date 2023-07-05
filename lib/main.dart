import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-do app'),
        ),
        body: const Column(children: [
          Center(
            child: Text('Welcome to To-do app'),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("yay");
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ]),
      ),
    );
  }
}
