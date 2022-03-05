import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vocabulary_note/hooks/use_vocabulary_list.dart';
import 'package:vocabulary_note/provider/app_setting.dart';
import 'package:vocabulary_note/ui/molecules/vocabulary_row.dart';
import 'package:vocabulary_note/ui/organisms/add_vocabulary_form.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useVocabularyList();
    final settingNotifier = ref.read(appSettingProvider.notifier);

    const loadingView = Center(child: CircularProgressIndicator());
    final vocabularyListView = ListView(
        children: _controller.vocabularyList.value
            .map((vocabulary) => VocabularyRow(
                  english: vocabulary.english,
                  japanese: vocabulary.japanese,
                  englishVisible: settingNotifier.english,
                  japaneseVisible: settingNotifier.japanese,
                ))
            .toList());

    const astToSetupView = Center(child: Text('Setting画面で表示設定をしよう⭐️'));

    final Widget _dispView = useMemoized(() {
      if (!settingNotifier.english && !settingNotifier.japanese) {
        return astToSetupView;
      }
      if (_controller.loading.value) {
        return loadingView;
      }
      return vocabularyListView;
    }, [
      settingNotifier.english,
      settingNotifier.japanese,
      _controller.loading.value
    ]);

    return Scaffold(
      body: Column(
        children: [
          Flexible(child: _dispView),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: false,
            builder: (_) => AddVocabularyForm(
              reload: _controller.addVocabularyList,
            ),
          )
        },
        tooltip: '語彙を追加する',
        child: const Icon(Icons.add),
      ),
    );
  }
}
