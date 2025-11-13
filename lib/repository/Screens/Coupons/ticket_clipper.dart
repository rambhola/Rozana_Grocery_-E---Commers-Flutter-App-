import 'package:flutter/material.dart';

/// This clipper creates the classic coupon/ticket shape
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 15.0;
    final path = Path();

    // Start at top-left
    path.moveTo(0, 0);

    // Left edge until the top of left notch
    path.lineTo(0, size.height / 2 - radius);
    path.arcToPoint(
      Offset(0, size.height / 2 + radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(0, size.height);

    // Bottom edge
    path.lineTo(size.width, size.height);

    // Right edge with notch
    path.lineTo(size.width, size.height / 2 + radius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 - radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    // Back to top edge
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// This painter draws the visible border following the same ticket path
class TicketBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = TicketClipper().getClip(size);

    final paint = Paint()
      ..color = Colors.grey.shade300 // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
