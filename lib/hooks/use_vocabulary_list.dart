import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Vocabulary {
  String english;
  String japanese;

  Vocabulary({required this.english, required this.japanese});
}

class UseVocabularyListResult {
  ValueNotifier<bool> loading;
  ValueNotifier<List<Vocabulary>> vocabularyList;
  Function fetchVocabularyList;

  UseVocabularyListResult(
      {required this.loading,
      required this.vocabularyList,
      required this.fetchVocabularyList});
}

UseVocabularyListResult useVocabularyList() {
  final loading = useState(true);
  final vocabularyList = useState<List<Vocabulary>>([]);

  void setVocabularyList(List<Vocabulary> newList) {
    vocabularyList.value = newList;
  }

  Future<void> fetchVocabularyList() async {
    loading.value = true;
    Future<List<Vocabulary>> fetchExec() async {
      List<Vocabulary> list = [
        Vocabulary(english: "discernible", japanese: "目に見える"),
        Vocabulary(english: "eponymous", japanese: "代名詞"),
        Vocabulary(english: "haphazardly", japanese: "手当たり次第"),
        Vocabulary(english: "sprawling", japanese: "だだっ広い"),
        Vocabulary(english: "sloppy", japanese: "締まりのない"),
      ];
      await Future.delayed(const Duration(seconds: 3));
      return Future<List<Vocabulary>>.value(list);
    }

    final list = await fetchExec();

    setVocabularyList(list);
    loading.value = false;
  }

  useEffect(() {
    fetchVocabularyList();
  }, const []);

  return UseVocabularyListResult(
    loading: loading,
    vocabularyList: vocabularyList,
    fetchVocabularyList: fetchVocabularyList,
  );
}
