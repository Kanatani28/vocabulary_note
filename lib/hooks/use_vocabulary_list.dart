import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocabulary_note/hooks/use_database.dart';
import 'package:vocabulary_note/models/vocabulary.dart';

class UseVocabularyListResult {
  ValueNotifier<bool> loading;
  ValueNotifier<List<Vocabulary>> vocabularyList;

  UseVocabularyListResult({
    required this.loading,
    required this.vocabularyList,
  });
}

UseVocabularyListResult useVocabularyList() {
  final loading = useState(true);
  final vocabularyList = useState<List<Vocabulary>>([]);
  ValueNotifier<Future<Database>> _databaseNotifier = useDatabase();
  Future<Database> database = _databaseNotifier.value;

  void setVocabularyList(List<Vocabulary> newList) {
    vocabularyList.value = newList;
  }

  Future<void> fetchVocabularyList() async {
    loading.value = true;
    Future<List<Vocabulary>> fetchExec() async {
      List<Map<String, Object?>> results =
          await (await database).query("vocabulary");

      List<Vocabulary> list = results
          .map((result) => Vocabulary(
              id: result["id"] as int,
              english: result["english"] as String,
              japanese: result["japanese"] as String))
          .toList();

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
  );
}
