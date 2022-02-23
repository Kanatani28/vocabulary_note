import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBottomNavigationBar extends HookWidget {
  final Map<String, IconData> menuItems;
  final int currentIndex;
  final void Function(int)? onTap;

  const MyBottomNavigationBar({
    Key? key,
    required this.menuItems,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    doNothing(int val) {
      print('doNothing');
    }

    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: menuItems.entries
          .map((menuItem) => BottomNavigationBarItem(
              label: menuItem.key, icon: Icon(menuItem.value)))
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
