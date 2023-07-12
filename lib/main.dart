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
  SharedPref sp = SharedPref();

  //init theme

  @override
  Widget build(BuildContext context) {
    sp.loadTheme();
    var theme = SharedPref.isDarkmode ? ThemeData.dark() : ThemeData.light();
    //if its darkmode then theme will be light mode vice versa
    // i know this is stupid but im dumb to find the actual problem so i reversed
    // it instead, then it suddenly works
    return GetMaterialApp(
      theme: theme,
      darkTheme: ThemeData.dark(),
      home: const DefaultScaffold(),
    );
  }
}
