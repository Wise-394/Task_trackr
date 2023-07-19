import 'package:flutter/material.dart';
import 'package:todo_app/database/sharedpref.dart';
import 'package:todo_app/default_scaffold.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPage();
}

class _PinPage extends State<PinPage> {
  void goToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  var sp = SharedPref();
  void onPressCheck() {
    sp.loadPin();
    final pin = sp.getPin();
    if (_textController.text.isNotEmpty &&
        _textController.text == pin.toString()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DefaultScaffold(),
        ),
      );
    }
  }

  //Navigator.of(context).pushReplacementNamed('/home');
  final _textController = TextEditingController();
  void onPressNum(int num) {
    _textController.text += num.toString();
  }

  void onPressClear() {
    String currentText = _textController.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      _textController.text = updatedText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 150),
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).colorScheme.primary),
                controller: _textController,
                enabled: false,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 75),
            // Generate rows of PinButton widgets using loops
            for (int row = 0; row < 3; row++)
              Padding(
                padding: EdgeInsets.only(top: row == 0 ? 0.0 : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Generate PinButton widgets for each column
                    for (int col = 1; col <= 3; col++)
                      PinButton(
                        textEditingController: _textController,
                        pinText: row * 3 + col,
                      ),
                  ],
                ),
              ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PinButtonIcon(
                  btnIcon: Icons.clear,
                  methodToDo: onPressClear,
                ),
              ),
              PinButton(pinText: 0, textEditingController: _textController),
              PinButtonIcon(methodToDo: onPressCheck, btnIcon: Icons.check)
            ]),
          ],
        ),
      ),
    );
  }
}

class PinButtonIcon extends StatelessWidget {
  final VoidCallback methodToDo;
  final IconData btnIcon;
  const PinButtonIcon({
    super.key,
    required this.methodToDo,
    required this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: methodToDo,
        style: TextButton.styleFrom(
          minimumSize: const Size(100, 70),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(fontSize: 25),
        ),
        child: Icon(btnIcon));
  }
}

class PinButton extends StatelessWidget {
  final int pinText;
  final TextEditingController textEditingController;
  const PinButton({
    required this.pinText,
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          textEditingController.text += pinText.toString();
        },
        style: TextButton.styleFrom(
          minimumSize: const Size(100, 70),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(fontSize: 25),
        ),
        child: Text(pinText.toString()));
  }
}
