import 'package:flutter/material.dart';

class BtnPrototype extends StatelessWidget {
  final VoidCallback btnAction;
  final String btnText;
  const BtnPrototype({
    super.key,
    required this.btnAction,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: btnAction, child: Text(btnText));
  }
}
