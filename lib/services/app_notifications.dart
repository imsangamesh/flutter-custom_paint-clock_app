import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class AppNotifications {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> scheduleAlarm() async {
    final scheduleNotificationTime =
        DateTime.now().add(const Duration(seconds: 10));

    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'pinklock',
        'pinklock',
        channelDescription: 'Channel for Alarm Notification',
      ),
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Office',
      'Good morning, Time for office!',
      tz.TZDateTime.from(scheduleNotificationTime, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
    );
  }

  Future<void> init() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null && details.payload!.isNotEmpty) {
          log(' - - - - - - ON NOTIFICATION TAP - - - - - - ');
          log('Payyload: ${details.payload}');
        }
      },
    );
  }
}
