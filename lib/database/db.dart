import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VocabularyNoteDB {
  static final VocabularyNoteDB _db = VocabularyNoteDB._internal();
  VocabularyNoteDB._internal();
  static VocabularyNoteDB get instance => _db;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'vocabulary_note_database.db'),
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE vocabulary(id INTEGER PRIMARY KEY AUTOINCREMENT, english TEXT, japanese TEXT)");
      },
      version: 1,
    );
  }
}
