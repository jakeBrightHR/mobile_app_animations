import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_four.dart';

class ChallengeOnePartFourPainter extends CustomPainter {
  List<SpinningSquarePartFour> squares;

  ChallengeOnePartFourPainter(this.squares);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.red
      ..style = PaintingStyle.stroke;


    /// Calculate spacing between each square
    final double ySpacing = size.height / squares.length;

    /// Offset spacing by center of screen
    final offset = Offset(0, (size.height - ySpacing) / 2);

    for (int i = 0; i < squares.length; i++) {
      /// Draw each square evenly
      Path path = squares[i].buildPath(size, offset.dy / 2 + ySpacing * i);
      paint.color = squares[i].getColor();
      paint.strokeWidth = squares[i].getStrokeWidth();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
