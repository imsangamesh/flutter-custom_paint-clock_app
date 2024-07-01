import 'package:flutter/material.dart';
import 'package:my_clock/core/data.dart';
import 'package:my_clock/my_menu_controller.dart';
import 'package:my_clock/screens/alarm_screen.dart';
import 'package:my_clock/screens/clock_screen.dart';
import 'package:my_clock/widgets/side_menu_btn.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2f41),
      body: Row(
        children: [
          /// ------------------------------ `SIDEBAR`
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems.map(SideMenuBtn.new).toList(),
            ),
          ),
          const VerticalDivider(color: Colors.white24, width: 1),

          /// ------------------------------ `MAIN CONTENT`
          Expanded(
            flex: 3,
            child: Consumer<MyMenuController>(
              builder: (context, ctrlr, child) {
                if (ctrlr.currentMenu == menuItems[0]) {
                  return const ClockScreen();
                } else if (ctrlr.currentMenu == menuItems[1]) {
                  return const AlarmScreen();
                } else if (ctrlr.currentMenu == menuItems[2]) {
                  return Container(color: Colors.pink);
                } else {
                  return Container(color: Colors.pink);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
