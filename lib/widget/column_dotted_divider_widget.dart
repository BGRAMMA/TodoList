import 'package:flutter/material.dart';

class ColumnDottedDivider extends StatelessWidget {
  const ColumnDottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: CustomPaint(
        painter: DottedDividerHorizontal(),
        size: const Size(double.infinity, 10), // 원하는 크기 설정
      ),
    );
  }
}

class DottedDividerHorizontal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // 점선 색상
      ..strokeWidth = 0.5 // 점선 두께
      ..style = PaintingStyle.stroke;

    const dashWidth = 15.0; // 점의 너비
    const dashSpace = 20.0; // 점 사이의 간격

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
