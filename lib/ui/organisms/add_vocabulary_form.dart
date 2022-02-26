import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/hooks/use_vocabulary_create_form.dart';

class AddVocabularyForm extends HookWidget {
  final void Function() reload;
  const AddVocabularyForm({Key? key, required this.reload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VocabularyCreateFromController _controller = useVocabularyCreateForm();
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Center(
                child: Text(
              "単語を登録する",
              style: Theme.of(context).textTheme.headline6,
            ))),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "English", border: OutlineInputBorder()),
              autofocus: true,
              onChanged: _controller.setEnglish,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "日本語", border: OutlineInputBorder()),
              onChanged: _controller.setJapanese,
            )),
        Center(
          child: ElevatedButton(
              child: const Text("登録"),
              onPressed: () async {
                await _controller.addVocabulary();
                Navigator.of(context).pop();
                reload();
              }),
        )
      ],
    );
  }
}
