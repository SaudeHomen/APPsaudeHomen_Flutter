import 'package:flutter/material.dart';

class BubbleBackground extends StatelessWidget {
  final Widget child;
  final Color color;

  const BubbleBackground({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fundo pintado
        Positioned.fill(child: CustomPaint(painter: BubbleBackgroundPainter(color))),

        // Conteúdo
        Positioned.fill(child: child),
      ],
    );
  }
}

class BubbleBackgroundPainter extends CustomPainter {
  final Color baseColor;
  BubbleBackgroundPainter(this.baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = baseColor.withValues(alpha: 0.20);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.10), 120, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.25), 150, paint);

    paint.color = baseColor.withValues(alpha: 0.13);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.60), 95, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.80), 110, paint);

    paint.color = baseColor.withValues(alpha: 0.10);
    canvas.drawCircle(Offset(size.width * 0.12, size.height * 0.85), 55, paint);
    canvas.drawCircle(Offset(size.width * 0.90, size.height * 0.55), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
