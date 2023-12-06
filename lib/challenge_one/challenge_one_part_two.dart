import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_two_painter.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_two.dart';

class ChallengeOnePartTwo extends StatefulWidget {
  const ChallengeOnePartTwo({super.key});

  @override
  State<ChallengeOnePartTwo> createState() => _ChallengeOnePartTwoState();
}

class _ChallengeOnePartTwoState extends State<ChallengeOnePartTwo> with SingleTickerProviderStateMixin {

  SpinningSquarePartTwo spinningSquare = SpinningSquarePartTwo(angle: 0);

  late Ticker ticker;

  @override
  void initState() {
    super.initState();
    ticker = createTicker(_tick)..start();
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  void _tick(Duration duration) {
    spinningSquare.tick(duration);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ChallengeOnePartTwoPainter(spinningSquare),
        child: Container(),
      ),
    );
  }
}