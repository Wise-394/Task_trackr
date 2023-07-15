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
  final SharedPref sp = SharedPref();
  sp.loadTheme();
  sp.loadPin();
  sp.loadPinSwitch();
  var theme = sp.getTheme() ? ThemeMode.dark : ThemeMode.light;
  var route = sp.getPin() != 0 && sp.getPinSwitch() ? '/lock' : '/home';

  runApp(MyApp(
    theme: theme,
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeMode theme;
  final String route;
  const MyApp({
    Key? key,
    required this.theme,
    required this.route,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
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
