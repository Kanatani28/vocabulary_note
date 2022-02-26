import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<bool> _loading = useState(true);
ValueNotifier<Future<Database>> _database =
    useState(getDatabasesPath().then((databasePath) {
  return openDatabase(join(databasePath, 'vocabulary_note_database.db'),
      onCreate: (db, version) {
    return db.execute(
        "CREATE TABLE vocabulary(id INTEGER PRIMARY KEY AUTOINCREMENT, english TEXT, japanese TEXT)");
  }, version: 1);
}));

ValueNotifier<Future<Database>> useDatabase() {
  return _database;
}
