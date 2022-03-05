import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/database/db.dart';
import 'package:vocabulary_note/models/vocabulary.dart';

class UseVocabularyListResult {
  UseVocabularyListResult({
    required this.loading,
    required this.vocabularyList,
    required this.fetchVocabularyList,
    required this.addVocabularyList,
  });
  ValueNotifier<bool> loading;
  ValueNotifier<List<Vocabulary>> vocabularyList;
  void Function() fetchVocabularyList;
  void Function(Vocabulary) addVocabularyList;
}

UseVocabularyListResult useVocabularyList() {
  final loading = useState(true);
  final vocabularyList = useState<List<Vocabulary>>([]);

  void setVocabularyList(List<Vocabulary> newList) {
    vocabularyList.value = newList;
  }

  void addVocabularyList(Vocabulary appendValue) {
    final newList = <Vocabulary>[...vocabularyList.value, appendValue];
    setVocabularyList(newList);
  }

  Future<void> fetchVocabularyList() async {
    loading.value = true;
    Future<List<Vocabulary>> fetchExec() async {
      final db = await VocabularyNoteDB.instance.database;
      final results = await db.query('vocabulary');

      final list = results
          .map((result) => Vocabulary(
              id: result['id']! as int,
              english: result['english']! as String,
              japanese: result['japanese']! as String))
          .toList();

      // await Future.delayed(const Duration(seconds: 3));
      return Future<List<Vocabulary>>.value(list);
    }

    final list = await fetchExec();

    setVocabularyList(list);
    loading.value = false;
  }

  // ignore: unnecessary_lambdas
  useEffect(() {
    fetchVocabularyList();
  }, const []);

  return UseVocabularyListResult(
    loading: loading,
    vocabularyList: vocabularyList,
    fetchVocabularyList: fetchVocabularyList,
    addVocabularyList: addVocabularyList,
  );
}
