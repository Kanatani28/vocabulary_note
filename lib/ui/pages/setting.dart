import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Setting extends HookWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Center(
            child: Text('設定画面です。'),
          )
        ],
      ),
    );
  }
}
