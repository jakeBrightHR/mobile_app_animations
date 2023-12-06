import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_three.dart';

class ChallengeOnePartThreePainter extends CustomPainter {
  SpinningSquarePartThree spinningSquare;

  ChallengeOnePartThreePainter(this.spinningSquare);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    Path path = spinningSquare.buildPath(size);
    paint.color = spinningSquare.getColor();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

