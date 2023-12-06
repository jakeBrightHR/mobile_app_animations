import 'package:flutter/material.dart';

class ChallengeOnePartOnePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.purple
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);

    canvas.drawRect(
      Rect.fromCenter(
        center: offset,
        width: 100,
        height: 100,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}