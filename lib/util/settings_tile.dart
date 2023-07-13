import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  final String tileTile;
  final IconData iconImg;
  final String iconText;
  final VoidCallback onPressed;
  const SettingsTile({
    super.key,
    required this.tileTile,
    required this.iconImg,
    required this.iconText,
    required this.onPressed,
  });

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
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
            Text(widget.tileTile),
            const Spacer(),
            ElevatedButton(
              onPressed: widget.onPressed,
              child: Row(
                children: [
                  Icon(widget.iconImg),
                  Text(widget.iconText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
