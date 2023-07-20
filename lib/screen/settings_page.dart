import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/sharedpref.dart';
import '../util/change_pin_dialog.dart';
import '../util/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPref sp = SharedPref();
  final _textEditingController = TextEditingController();
  final _hintTextEditingController = TextEditingController();
  bool switchOn = false;

  @override
  void initState() {
    super.initState();
    switchOn = sp.getPinSwitch(); // Set switchOn based on pinSwitch value
  }

  void onPressSwitch(bool value) {
    setState(() {
      switchOn = value;
      sp.updatePinSwitch(switchOn);
    });
  }

  void onSavePin() {
    if (_textEditingController.text.isNotEmpty &&
        _textEditingController.text.isNumericOnly &&
        _textEditingController.text.length.isGreaterThan(0) &&
        _textEditingController.text.length.isLowerThan(9)) {
      sp.updatePin(int.parse(_textEditingController.text));
      Navigator.of(context).pop();
    }
  }

  void onPressChangePin() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ChangePinDialog(
          isChangePin: true,
          dialogTitle: 'Change Pin',
          dialogHint: 'Pin must be between 4-8 digits',
          textController: _textEditingController,
          onSave: () => onSavePin(),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //pinHint
  void onPressChangePinHint() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ChangePinDialog(
          isChangePin: false,
          dialogTitle: 'Forgot Password Hint',
          dialogHint:
              'This hint will be displayed if you forgotten your password',
          textController: _hintTextEditingController,
          onSave: () => onSavePinHint(),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void onSavePinHint() {
    if (_hintTextEditingController.text.isNotEmpty) {
      sp.updatePinHint(_hintTextEditingController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingsTile(
          tileTile: "Change Theme",
          iconImg: sp.getTheme() ? Icons.sunny : Icons.mode_night,
          iconText: sp.getTheme() ? "Light mode" : "Dark Mode",
          onPressed: () {
            sp.changeTheme();
            setState(() {});
          },
        ),
        SettingsSwitchTile(
            tileTile: "Enable Pin Lock",
            value: switchOn,
            onChanged: (value) => onPressSwitch(value!)),
        SettingsTile(
          enabled: switchOn,
          tileTile: "Change Pin",
          iconText: "PIN",
          iconImg: Icons.pin,
          onPressed: onPressChangePin,
        ),
        SettingsTile(
          tileTile: 'Forgot Password Hint',
          iconImg: Icons.question_mark,
          iconText: 'HINT',
          onPressed: () => onPressChangePinHint(),
          enabled: switchOn,
        ),
      ],
    );
  }
}
