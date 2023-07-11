import 'package:flutter/material.dart';
import 'package:todo_app/database/task_entity.dart';
import 'package:todo_app/default_scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

void main() async {
  // Init Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  // Open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
    );

    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: colorScheme,
      ),
      themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      home: const DefaultScaffold(),
    );
  }
}
