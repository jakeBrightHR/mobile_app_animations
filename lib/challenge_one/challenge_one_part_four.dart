import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_app_animations/challenge_one/challenge_one_part_four_painter.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_four.dart';

class ChallengeOnePartFour extends StatefulWidget {
  const ChallengeOnePartFour({super.key});

  @override
  State<ChallengeOnePartFour> createState() => _ChallengeOnePartFourState();
}

class _ChallengeOnePartFourState extends State<ChallengeOnePartFour> with SingleTickerProviderStateMixin {

  SpinningSquarePartFour square = SpinningSquarePartFour(angle: 0, strokeWidth: 1);
  SpinningSquarePartFour square2 = SpinningSquarePartFour(angle: 35, strokeWidth: 4);
  SpinningSquarePartFour square3 = SpinningSquarePartFour(angle: 70,strokeWidth: 8);

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
    square.tick(duration);
    square2.tick(duration);
    square3.tick(duration);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ChallengeOnePartFourPainter([square, square2, square3]),
        child: Container(),
      ),
    );
  }
}