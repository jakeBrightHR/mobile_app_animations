
import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  final double radius;

  CircleClipper(this.radius);
  @override
  getClip(Size size) {
    var path = Path();
    Offset offset = Offset(size.width/2, size.height/2);
    path.addOval(Rect.fromCircle(center: offset, radius: radius));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}