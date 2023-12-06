import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class SpinningSquarePartThree {
  double width;
  double height;
  double angle;

  SpinningSquarePartThree({this.width = 100, this.height = 100, this.angle = 0});

  bool _shouldGrowWidth = true;
  bool _shouldGrowHeight = true;
  
  final double _maxWidth = 200, _maxHeight = 200;
  final double _minWidth = 20, _minHeight = 20;

  Path buildPath(Size size) {
    Path path = Path();

    Offset offset = Offset(size.width / 2, size.height / 2);

    path.addRect(
      Rect.fromCenter(
        center: offset,
        width: width,
        height: height,
      ),
    );

    path = rotatePathAroundOffset(path, offset, angle);
    path.close();

    return path;
  }

  Color getColor() {
    var time = DateTime.now().millisecondsSinceEpoch / 10;
    return HSLColor.fromAHSL(1.0, time % 360, 1.0, 0.5).toColor();
  }

  void tick(Duration duration) {
    angle += 1;

    _shouldGrowWidth = shouldGrowWidth();

    if (_shouldGrowWidth) {
      width += 1;
    } else {
      width -= 1;
    }

    _shouldGrowHeight = shouldGrowHeight();
    if (_shouldGrowHeight) {
      height += 1;
    } else {
      height -= 1;
    }
  }

  bool shouldGrowWidth() {
    if (_shouldGrowWidth && width > _maxWidth) {
      return false;
    } else if (!_shouldGrowWidth && width < _minWidth) {
      return true;
    }
    return _shouldGrowWidth;
  }

  bool shouldGrowHeight() {
    if (_shouldGrowHeight && width > _maxHeight) {
      return false;
    } else if (!_shouldGrowHeight && width < _minHeight) {
      return true;
    }
    return _shouldGrowHeight;
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
