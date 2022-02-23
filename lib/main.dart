import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import './ui/pages/home.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(appName),
      ),
      body: const Home(),
    );
  }
}
