import 'package:flutter/material.dart';
import 'package:todo_app/database/task_entity.dart';
import 'package:todo_app/default_scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/pin_page.dart';
import 'database/sharedpref.dart';

void main() async {
  // Init Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  var box = await Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SharedPref sp = SharedPref();

  @override
  @override
  Widget build(BuildContext context) {
    sp.loadTheme();
    sp.loadPin();
    var theme = sp.isDarkmode ? ThemeMode.dark : ThemeMode.light;
    var route = sp.getPin() > 0 ? '/lock' : '/home';
    print("current route value is $route");
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme,
      initialRoute: route,
      routes: {
        '/lock': (context) => const PinPage(),
        '/home': (context) => const DefaultScaffold(),
      },
    );
  }
}
