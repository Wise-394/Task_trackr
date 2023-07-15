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
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TODO',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
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
