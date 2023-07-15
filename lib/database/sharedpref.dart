import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class SharedPref {
  //theme
  static bool isDarkmode = false;
  final _sharedPref = Hive.box('mybox');

  void loadTheme() {
    isDarkmode = _sharedPref.get('themeMode', defaultValue: false);
  }

  void updateTheme() {
    _sharedPref.put('themeMode', isDarkmode);
  }

  bool getTheme() {
    return isDarkmode;
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
  static int pin = 0;
  static bool isPinEnable = false;
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

  void loadPinSwitch() {
    isPinEnable = _sharedPref.get('pinSwitch', defaultValue: false);
  }

  void updatePinSwitch(bool pinSwitchValue) {
    _sharedPref.put('pinSwitch', pinSwitchValue);
    isPinEnable = pinSwitchValue;
  }

  bool getPinSwitch() {
    return isPinEnable;
  }
}
