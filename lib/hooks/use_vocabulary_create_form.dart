import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vocabulary_note/database/db.dart';

class VocabularyCreateFromController {
  VocabularyCreateFromController({
    required this.english,
    required this.japanese,
    required this.addVocabulary,
    required this.setEnglish,
    required this.setJapanese,
  });
  ValueNotifier<String> english;
  ValueNotifier<String> japanese;
  Future<void> Function() addVocabulary;
  void Function(String)? setEnglish;
  void Function(String)? setJapanese;
}

VocabularyCreateFromController useVocabularyCreateForm() {
  final english = useState('');
  final japanese = useState('');

  void setEnglish(String value) {
    english.value = value;
  }

  void setJapanese(String value) {
    japanese.value = value;
  }

  Future<void> addVocabulary() async {
    final db = await VocabularyNoteDB.instance.database;

    await db.insert(
        'vocabulary', {'english': english.value, 'japanese': japanese.value});
  }

  return VocabularyCreateFromController(
      english: english,
      japanese: japanese,
      addVocabulary: addVocabulary,
      setEnglish: setEnglish,
      setJapanese: setJapanese);
}
