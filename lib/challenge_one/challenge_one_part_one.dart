import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_one_painter.dart';

class ChallengeOnePartOne extends StatefulWidget {
  const ChallengeOnePartOne({super.key});

  @override
  State<ChallengeOnePartOne> createState() => _ChallengeOnePartOneState();
}

class _ChallengeOnePartOneState extends State<ChallengeOnePartOne> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ChallengeOnePartOnePainter(),
        child: Container(),
      ),
    );
  }
}