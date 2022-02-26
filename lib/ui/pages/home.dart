import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/hooks/use_vocabulary_list.dart';
import 'package:vocabulary_note/ui/organisms/add_vocabulary_form.dart';
import 'package:vocabulary_note/ui/molecules/vocabulary_row.dart';

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
                          .map((vocabulary) => VocabularyRow(
                              english: vocabulary.english,
                              japanese: vocabulary.japanese))
                          .toList())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            builder: (_) => AddVocabularyForm(
              reload: _controller.fetchVocabularyList,
            ),
          )
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
