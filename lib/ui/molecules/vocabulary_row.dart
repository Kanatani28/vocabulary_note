import 'package:flutter/material.dart';

class VocabularyRow extends StatelessWidget {
  final String english;
  final String japanese;

  const VocabularyRow({required this.english, required this.japanese, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Center(
                  child: Text(
                english,
                style:
                    // const TextStyle(
                    //   fontWeight: FontWeight.bold

                    //   )
                    Theme.of(context).textTheme.subtitle1,
              )),
              // color: Colors.blue,
            )),
            Expanded(
                child: Container(
              child: Center(
                  child: Text(
                japanese,
                style: Theme.of(context).textTheme.subtitle1,
              )),
              // color: Colors.red,
            ))
          ],
        ));
  }
}
