
import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one.dart';
import 'package:mobile_app_animations/challenge_two/challenge_two.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              button(
                context,
                'Challenge One',
                const ChallengeOne(),
              ),
              button(
                context,
                'Challenge Two',
                const ChallengeTwo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget button(BuildContext context, String label, Widget route) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
