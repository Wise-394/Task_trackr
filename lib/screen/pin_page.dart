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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 200,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          )
        ]),
      ),
    );
  }
}
