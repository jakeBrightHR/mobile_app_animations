import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_three_painter.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_three.dart';

class ChallengeOnePartThree extends StatefulWidget {
  const ChallengeOnePartThree({super.key});

  @override
  State<ChallengeOnePartThree> createState() => _ChallengeOnePartThreeState();
}

class _ChallengeOnePartThreeState extends State<ChallengeOnePartThree> with SingleTickerProviderStateMixin {

  SpinningSquarePartThree spinningSquare = SpinningSquarePartThree(angle: 0);

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
        painter: ChallengeOnePartThreePainter(spinningSquare),
        child: Container(),
      ),
    );
  }
}