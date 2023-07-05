import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-do app',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorScheme.primary,
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
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
    ]);
  }
}
