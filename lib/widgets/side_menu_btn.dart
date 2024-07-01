import 'package:flutter/material.dart';
import 'package:my_clock/my_menu_controller.dart';
import 'package:provider/provider.dart';

class SideMenuBtn extends StatelessWidget {
  const SideMenuBtn(this.menu, {super.key});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyMenuController>(
      builder: (context, ctrlr, child) {
        return InkWell(
          onTap: () => ctrlr.updateMenu(menu),
          child: Ink(
            color: ctrlr.currentMenu.title == menu.title
                ? const Color(0xFF3A3D55)
                : Colors.transparent,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(menu.image, scale: 1.5),
                const SizedBox(height: 12),
                Text(
                  menu.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
