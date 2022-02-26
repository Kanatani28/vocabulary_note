import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:vocabulary_note/hooks/use_database.dart';
import 'package:vocabulary_note/models/vocabulary.dart';

class VocabularyCreateFromController {
  ValueNotifier<String> english;
  ValueNotifier<String> japanese;
  Future<void> Function() addVocabulary;
  void Function(String)? setEnglish;
  void Function(String)? setJapanese;

  VocabularyCreateFromController({
    required this.english,
    required this.japanese,
    required this.addVocabulary,
    required this.setEnglish,
    required this.setJapanese,
  });
}

VocabularyCreateFromController useVocabularyCreateForm() {
  ValueNotifier<Future<Database>> _databaseNotifier = useDatabase();
  Future<Database> database = _databaseNotifier.value;
  ValueNotifier<String> english = useState("");
  ValueNotifier<String> japanese = useState("");

  void setEnglish(String value) {
    english.value = value;
  }

  void setJapanese(String value) {
    japanese.value = value;
  }

  addVocabulary() async {
    Database _database = await database;

    await _database.insert(
        "vocabulary", {"english": english.value, "japanese": japanese.value});
  }

  return VocabularyCreateFromController(
      english: english,
      japanese: japanese,
      addVocabulary: addVocabulary,
      setEnglish: setEnglish,
      setJapanese: setJapanese);
}
