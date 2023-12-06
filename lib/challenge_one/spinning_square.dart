import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class SpinningSquare {
  double angle;

  SpinningSquare(this.angle);

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

/// Helper method that makes it easier to rotate a [path] around
/// an [offset]
Path rotatePathAroundOffset(Path path, Offset offset, double degrees) {
  Matrix4 mtx = Matrix4.identity();
  mtx.translate(offset.dx, offset.dy);
  mtx.multiply(Matrix4.rotationZ(vector_math.radians(degrees)));
  mtx.translate(-offset.dx, -offset.dy);

  path = path.transform(mtx.storage);
  return path;
}
