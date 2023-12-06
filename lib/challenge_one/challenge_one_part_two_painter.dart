import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square.dart';

class ChallengeOnePartTwoPainter extends CustomPainter {
  SpinningSquare spinningSquare;

  ChallengeOnePartTwoPainter(this.spinningSquare);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    Path path = spinningSquare.buildPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

