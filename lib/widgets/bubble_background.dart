import 'package:flutter/material.dart';

class BubbleBackgroundPainter extends CustomPainter {
  final Color baseColor;
  BubbleBackgroundPainter(this.baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = baseColor.withValues(alpha:0.12);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.25), 110, paint);

    paint.color = baseColor.withValues(alpha:0.10);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 70, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.75), 80, paint);

    paint.color = baseColor.withValues(alpha:0.08);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.8), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.55), 35, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
