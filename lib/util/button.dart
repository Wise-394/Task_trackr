import 'package:flutter/material.dart';

class BtnPrototype extends StatelessWidget {
  VoidCallback btnAction;
  String btnText;
  BtnPrototype({
    super.key,
    required this.btnAction,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: btnAction, child: Text(btnText));
  }
}
