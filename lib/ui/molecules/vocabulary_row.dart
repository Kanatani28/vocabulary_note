import 'package:flutter/material.dart';

class VocabularyRow extends StatelessWidget {
  const VocabularyRow(
      {required this.english,
      required this.japanese,
      required this.englishVisible,
      required this.japaneseVisible,
      Key? key})
      : super(key: key);
  final String english;
  final String japanese;
  final bool englishVisible;
  final bool japaneseVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (englishVisible)
              Expanded(
                  child: Center(
                      child: Text(
                english,
                style: Theme.of(context).textTheme.subtitle1,
              ))),
            if (japaneseVisible)
              Expanded(
                  child: Center(
                      child: Text(
                japanese,
                style: Theme.of(context).textTheme.subtitle1,
              )))
          ],
        ));
  }
}
