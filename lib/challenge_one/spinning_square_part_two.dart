import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_one/spinning_square_part_three.dart';

class SpinningSquarePartTwo {
  double angle;

  SpinningSquarePartTwo({this.angle = 0});

  Path buildPath(Size size) {
    Path path = Path();

    Offset offset = Offset(size.width / 2, size.height / 2);

    path.addRect(
      Rect.fromCenter(
        center: offset,
        width: 100,
        height: 100,
      ),
    );
    path = rotatePathAroundOffset(path, offset, angle);
    path.close();

    return path;
  }

  void tick(Duration duration) {
    angle += 1;
  }
}
