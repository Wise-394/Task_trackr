import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                    print('yay');
                  },
                  child: const Text('test'))
            ],
          ),
        ));
  }
}
