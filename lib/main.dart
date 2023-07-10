import 'package:flutter/material.dart';
import 'package:todo_app/default_scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Init Hive
  await Hive.initFlutter();

  // Open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: colorScheme,
      ),
      home: const DefaultScaffold(),
    );
  }
}
