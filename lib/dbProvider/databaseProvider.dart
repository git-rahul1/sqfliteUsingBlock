import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String tableName = 'tasks';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';

  static final DatabaseProvider dbProvider = DatabaseProvider();

  late Database database;

  Future<Database> get open async {
    if (database == null) {
      database = await createDatabase();
    }
    return database;
  }

  Future<Database> createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'demo.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnDescription TEXT)',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await open;
    return db.query(tableName);
  }

  Future<int> insertTask(Map<String, dynamic> task) async {
    final db = await open;
    return await db.insert(tableName, task);
  }

  Future<int> updateTask(Map<String, dynamic> task) async {
    final db = await open;
    return await db.update(tableName, task, where: '$columnId = ?', whereArgs: [task[columnId]]);
  }

  Future<int> deleteTask(int id) async {
    final db = await open;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
