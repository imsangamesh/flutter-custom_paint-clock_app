import 'dart:ui';

class Alarm {
  Alarm({
    required this.date,
    required this.title,
    required this.isActive,
    required this.colors,
  });

  final DateTime date;
  final String title;
  final bool isActive;
  final List<Color> colors;
}
