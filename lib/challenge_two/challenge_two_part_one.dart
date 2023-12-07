import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_two/circle_clipper.dart';

class ChallengeTwoPartOne extends StatefulWidget {
  const ChallengeTwoPartOne({super.key});

  @override
  State<ChallengeTwoPartOne> createState() => _ChallengeTwoPartOneState();
}

class _ChallengeTwoPartOneState extends State<ChallengeTwoPartOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CircleClipper(150),
        child: const Image(
          image: AssetImage('assets/dog.jpeg'),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
