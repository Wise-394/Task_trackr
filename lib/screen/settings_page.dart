import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/sharedpref.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPref sp = SharedPref();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        changeThemeTile(context),
        changePinTile(context),
      ],
    );
  }

  Padding changeThemeTile(BuildContext context) {
    return Padding(
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
                sp.changeTheme();
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
    );
  }

  Padding changePinTile(BuildContext context) {
    return Padding(
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
            const Text("Change Pin"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.pin),
                  Text("PIN"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
