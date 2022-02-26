class Vocabulary {
  final int id;
  final String english;
  final String japanese;

  Vocabulary({required this.id, required this.english, required this.japanese});

  Map<String, dynamic> toMap() {
    return {"id": id, "english": english, "japanese": japanese};
  }
}
