import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  final String tileTile;
  final IconData iconImg;
  final String iconText;
  final VoidCallback onPressed;
  final bool enabled;
  const SettingsTile({
    super.key,
    required this.tileTile,
    required this.iconImg,
    required this.iconText,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.enabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.background,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(widget.tileTile),
            const Spacer(),
            ElevatedButton(
              onPressed: widget.enabled ? widget.onPressed : null,
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

class SettingsSwitchTile extends StatefulWidget {
  final String tileTile;
  final bool value;
  final Function(bool?)? onChanged;
  const SettingsSwitchTile({
    super.key,
    required this.tileTile,
    required this.value,
    required this.onChanged,
  });

  @override
  State<SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              value: widget.value,
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
