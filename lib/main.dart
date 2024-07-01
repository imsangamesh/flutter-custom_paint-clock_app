import 'package:flutter/material.dart';
import 'package:my_clock/home.dart';
import 'package:my_clock/my_menu_controller.dart';
import 'package:my_clock/services/app_notifications.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppNotifications().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<MyMenuController>(
        create: (context) => MyMenuController(),
        child: const Home(),
      ),
    );
  }
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2f41),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: const Color(0x06FFFFFF),
          child: const CustomPaint(
            painter: TestingPainter(),
          ),
        ),
      ),
    );
  }
}

class TestingPainter extends CustomPainter {
  const TestingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const RadialGradient(colors: [Colors.pink, Colors.green])
          .createShader(const Rect.fromLTRB(0, 0, 100, 100))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset.zero, const Offset(100, 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
