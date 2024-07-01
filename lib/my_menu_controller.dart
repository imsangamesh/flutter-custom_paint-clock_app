import 'package:flutter/material.dart';
import 'package:my_clock/core/data.dart';

class MyMenuController extends ChangeNotifier {
  Menu currentMenu = menuItems[1];

  void updateMenu(Menu menu) {
    currentMenu = menu;
    notifyListeners();
  }
}

class Menu {
  Menu({required this.title, required this.image});

  final String title;
  final String image;
}
