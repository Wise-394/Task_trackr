import 'package:flutter/material.dart';
import 'package:todo_app/screen/home_page.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPage();
}

class _PinPage extends State<PinPage> {
  void goToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  //Navigator.of(context).pushReplacementNamed('/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 150),
            const SizedBox(
              width: 250,
              child: TextField(
                enabled: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
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
                        pinText: row * 3 + col,
                      ),
                  ],
                ),
              ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Text("done for today"))
          ],
        ),
      ),
    );
  }
}

class PinButton extends StatelessWidget {
  final int pinText;
  const PinButton({
    required this.pinText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
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
