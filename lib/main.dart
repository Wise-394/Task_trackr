import 'package:flutter/material.dart';
import 'package:task_trackr/database/task_entity.dart';
import 'package:task_trackr/default_scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:task_trackr/screen/pin_page.dart';
import 'package:task_trackr/themes/dark_mode.dart';
import 'database/sharedpref.dart';
import 'themes/light_mode.dart';
import 'package:flutter/services.dart';

void main() async {
  // Init Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  await Hive.openBox('mybox');
  final SharedPref sp = SharedPref();
  _initData();
  var theme = sp.getTheme() ? ThemeMode.dark : ThemeMode.light;
  var route = sp.getPin() != 0 && sp.getPinSwitch() ? '/lock' : '/home';
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(
    theme: theme,
    route: route,
  ));
}

void _initData() {
  final SharedPref sp = SharedPref();
  sp.loadTheme();
  sp.loadPin();
  sp.loadPinSwitch();
  sp.loadPinHint();
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
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme,
      initialRoute: route,
      routes: {
        '/lock': (context) => const PinPage(),
        '/home': (context) => const DefaultScaffold(),
      },
    );
  }
}
