import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/ui/organisms/common/bottom_navigation_bar.dart';

import './ui/pages/home.dart';
import './hooks/use_navigation_menu.dart';

void main() {
  runApp(const MyApp());
}

const appName = 'Vocabulary Note';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: const Home(title: 'Vocabulary Note'),
      home: const _PageRoot(),
    );
  }
}

class _PageRoot extends HookWidget {
  const _PageRoot({Key? key}) : super(key: key);
  static final menuItems = <String, IconData>{
    'ホーム': Icons.home,
    'Setting': Icons.settings,
  };

  @override
  Widget build(BuildContext context) {
    final _navigationController = useNavigationMenu();
    return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
        ),
        body: _navigationController.currentPage,
        bottomNavigationBar: MyBottomNavigationBar(
          menuItems: menuItems,
          currentIndex: _navigationController.currentPageIndex.value,
          onTap: _navigationController.setCurrentPageIndex,
        ));
  }
}
