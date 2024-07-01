import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyClock extends StatefulWidget {
  const MyClock({super.key});

  @override
  State<MyClock> createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        size: const Size(270, 270),
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final time = DateTime.now();

  //* after 1 second, the angle would be:
  final secAngle = DateTime.now().second * 6;
  //* after 1 minute, the angle would be:
  final minAngle = DateTime.now().minute * 6;
  //* after 1 minute, the hour angle would be:
  final hourAngle = DateTime.now().hour * 30 + DateTime.now().minute * 0.5;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    // Background
    final fillBrush = Paint()..color = const Color(0xff444974);
    canvas.drawCircle(center, radius * 0.75, fillBrush);

    // Outline
    final outlineBrush = Paint()
      ..color = const Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    // Hour Hand
    final hourHandX = centerX + radius * 0.4 * cos(hourAngle * pi / 180);
    final hourHandY = centerY + radius * 0.4 * sin(hourAngle * pi / 180);
    final hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xffea74ab), Color(0xffc279fb)])
              .createShader(Rect.fromCircle(center: center, radius: 55))
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 24
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    // Minute Hand
    final minuteHandX = centerX + radius * 0.6 * cos(minAngle * pi / 180);
    final minuteHandY = centerY + radius * 0.6 * sin(minAngle * pi / 180);
    final minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xff7483f6), Color(0xff77ddff)])
              .createShader(Rect.fromCircle(center: center, radius: 70))
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 30
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minHandBrush);

    // Second Hand
    final secHandX = centerX + radius * 0.6 * cos(secAngle * pi / 180);
    final secHandY = centerY + radius * 0.6 * sin(secAngle * pi / 180);
    final secHandBrush = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 60
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // Center Dot
    final centerFillBrush = Paint()..color = const Color(0xffeaecff);
    canvas.drawCircle(center, radius * 0.12, centerFillBrush);

    // Outer Small Dashes
    final outerDashRadius = radius * 0.93;
    final innerDashRadius = radius * 0.9;
    final outerDashBrush = Paint()
      ..strokeWidth = 2
      ..color = const Color(0xFF5F66A6)
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 360; i += 6) {
      final x1 = centerX + outerDashRadius * cos(i * pi / 180);
      final y1 = centerY + outerDashRadius * sin(i * pi / 180);
      final x2 = centerX + innerDashRadius * cos(i * pi / 180);
      final y2 = centerY + innerDashRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), outerDashBrush);
    }

    // Outer Lines
    final outerCircleRadius = radius;
    final innerCircleRadius = radius * 0.9;
    final outerLinesBrush = Paint()
      ..strokeWidth = 2
      ..color = const Color(0xffeaecff)
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 360; i += 30) {
      final x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      final y1 = centerY + outerCircleRadius * sin(i * pi / 180);
      final x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      final y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), outerLinesBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
