import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddVocabularyForm extends HookWidget {
  const AddVocabularyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Center(
                child: Text(
              "単語を登録する",
              style: Theme.of(context).textTheme.headline6,
            ))),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "English", border: OutlineInputBorder()),
              autofocus: true,
            )),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "日本語", border: OutlineInputBorder()),
            )),
        Center(
          child: ElevatedButton(
            child: const Text("登録"),
            onPressed: () => {},
          ),
        )
      ],
    );
  }
}
