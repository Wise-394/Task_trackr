import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Text("Change Theme"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    changeTheme();
                  },
                  child: Row(
                    children: [
                      Icon(Get.isDarkMode ? Icons.sunny : Icons.mode_night),
                      Text(Get.isDarkMode ? "Light mode" : "Dark Mode"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
