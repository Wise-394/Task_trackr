import 'package:flutter/material.dart';
import 'screen/settings_page.dart';
import 'screen/home_page.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold({
    super.key,
  });

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

void onPressed() {}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  int _selectedIndex = 0;
  List<Widget> body = [const HomeStack(), const SettingsPage()];

  _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("current page is home");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Task Trackr',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(child: body[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Theme.of(context).colorScheme.primary,
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
