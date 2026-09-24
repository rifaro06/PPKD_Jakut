import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tugas_12.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            password TEXT NOT NULL,
            kota TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    final database = await instance.database;

    return await database.insert(
      'users',
      user.toMap(),
    );
  }

  Future<List<User>> getUsers() async {
    final database = await instance.database;

    final result = await database.query(
      'users',
      orderBy: 'id DESC',
    );

    return result.map((map) => User.fromMap(map)).toList();
  }
}