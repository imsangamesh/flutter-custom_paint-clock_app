import 'package:my_clock/core/theme_data.dart';
import 'package:my_clock/models/alarm.dart';
import 'package:my_clock/my_menu_controller.dart';

final List<Menu> menuItems = [
  Menu(title: 'Clock', image: 'assets/clock_icon.png'),
  Menu(title: 'Alarm', image: 'assets/alarm_icon.png'),
  Menu(title: 'Timer', image: 'assets/timer_icon.png'),
  Menu(title: 'Stopwatch', image: 'assets/stopwatch_icon.png'),
];

List<Alarm> alarms = [
  Alarm(
    date: DateTime.now().add(const Duration(hours: 1)),
    title: 'Office',
    isActive: false,
    colors: kSky,
  ),
  Alarm(
    date: DateTime.now().add(const Duration(hours: 2)),
    title: 'Sport',
    isActive: true,
    colors: kSunset,
  ),
];
