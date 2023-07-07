import 'package:flutter/material.dart';

import 'home_stack.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold({
    super.key,
  });

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  int _selectedIndex = 0;
  List<Widget> body = const [HomeStack(), Placeholder()];

  _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'To-do',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(child: body[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int newIndex) {
            _changeIndex(newIndex);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
    );
  }
}