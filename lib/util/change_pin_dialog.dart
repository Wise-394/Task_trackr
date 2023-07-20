import 'package:flutter/material.dart';

import 'button.dart';

class ChangePinDialog extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final TextEditingController textController;
  final String dialogTitle;
  final String dialogHint;
  final bool isChangePin;
  const ChangePinDialog({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.textController,
    required this.dialogTitle,
    required this.dialogHint,
    required this.isChangePin,
  });

  @override
  State<ChangePinDialog> createState() => _ChangePinDialog();
}

class _ChangePinDialog extends State<ChangePinDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(widget.dialogTitle),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: widget.textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType:
                widget.isChangePin ? TextInputType.number : TextInputType.text,
            obscureText: widget.isChangePin ? true : false,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.dialogHint,
            style: const TextStyle(fontStyle: FontStyle.italic),
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
