import 'package:flutter/material.dart';

import 'button.dart';

class ChangePinDialog extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  const ChangePinDialog({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<ChangePinDialog> createState() => _ChangePinDialog();
}

class _ChangePinDialog extends State<ChangePinDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Change Pin"),
        content: const Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            obscureText: true,
          )
        ]),
        actions: <Widget>[
          BtnPrototype(
            btnAction: widget.onCancel,
            btnText: 'Cancel',
          ),
          BtnPrototype(btnAction: widget.onSave, btnText: "Save")
        ]);
  }
}
