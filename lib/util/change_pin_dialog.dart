import 'package:flutter/material.dart';

import 'button.dart';

class ChangePinDialog extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final TextEditingController textController;
  const ChangePinDialog({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.textController,
  });

  @override
  State<ChangePinDialog> createState() => _ChangePinDialog();
}

class _ChangePinDialog extends State<ChangePinDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Change Pin"),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: widget.textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Pin must be between 4-8 digits',
            style: TextStyle(fontStyle: FontStyle.italic),
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
