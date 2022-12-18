part of '../../../codartdesign.dart';

class RingPainter extends CustomPainter {
  RingPainter({
    this.color,
    this.strokeWidth,
});

  final Color? color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? gray200
      ..strokeWidth = strokeWidth ?? 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}