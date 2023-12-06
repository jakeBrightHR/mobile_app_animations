import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_one.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_two.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            button(
              context,
              'Challenge One: Part One',
              const ChallengeOnePartOne(),
            ),
            button(
              context,
              'Challenge One: Part Two',
              const ChallengeOnePartTwo(),
            ),
          ],
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
