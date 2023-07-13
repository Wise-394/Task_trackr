import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class SharedPref {
  static bool isDarkmode = false;
  final _sharedPref = Hive.box('mybox');

  void loadTheme() {
    isDarkmode = _sharedPref.get('themeMode', defaultValue: false);
  }

  void updateTheme() {
    _sharedPref.put('themeMode', isDarkmode);
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      isDarkmode = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      isDarkmode = true;
    }
    updateTheme();
    //  print("updatedTheme isdarkmode = $isDarkmode");
  }
}
