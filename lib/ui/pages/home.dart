import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/hooks/use_vocabulary_list.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = useVocabularyList();

    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: _controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: _controller.vocabularyList.value
                          .map((vocabulary) => Row(
                                children: [
                                  Text(vocabulary.english,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  Text(vocabulary.japanese)
                                ],
                              ))
                          .toList())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
