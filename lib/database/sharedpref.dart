import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class SharedPref {
  //theme
  bool isDarkmode = false;
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

  //pin
  int pin = 0;
  void loadPin() {
    pin = _sharedPref.get('pin', defaultValue: 0);
    print("current pin is $pin");
  }

  void updatePin(int pinToUpdate) {
    _sharedPref.put('pin', pinToUpdate);
    pin = pinToUpdate;
  }

  int getPin() {
    return pin;
  }
}
