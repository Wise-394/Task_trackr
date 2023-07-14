import 'package:flutter/material.dart';
import 'package:todo_app/database/task_entity.dart';
import 'package:todo_app/default_scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'database/sharedpref.dart';

void main() async {
  // Init Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  // Open a box
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //init sharedpref
  final SharedPref sp = SharedPref();

  //init theme

  @override
  Widget build(BuildContext context) {
    sp.loadTheme();
    sp.loadPin();
    var theme = sp.isDarkmode ? ThemeMode.dark : ThemeMode.light;
    // print("restarted isdarkmode = $theme");
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme,
      home: const DefaultScaffold(),
    );
  }
}
