import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_flutter_mobile_project/bloc/Item.dart';

class DatabaseService {
  static String _table = 'items';

  static Future<Database> getDatabase() async {
    final database = openDatabase(join(await getDatabasesPath(), '$_table.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $_table(id TEXT PRIMARY KEY, title TEXT, content TEXT, createdAt TEXT)',
      );
    }, version: 1);

    return database;
  }

  static Future<List<Item>> getItemsByDate(DateTime date) async {
    final Database db = await DatabaseService.getDatabase();

    // Start Date and End Date
    final String startDate = date.toString().substring(0, 10);
    final String endDate =
        date.add(const Duration(days: 1)).toString().substring(0, 10);

    final String query =
        "SELECT * FROM $_table WHERE createdAt BETWEEN '${startDate}' AND '${endDate}' ORDER BY createdAt DESC";

    final List<Map<String, dynamic>> maps = await db.rawQuery(query);

    log(query);

    if (maps.length == 0) {
      return [];
    }

    return List.generate(maps.length, (i) {
      return Item(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        onPressed: () {},
        createdAt: DateTime.parse(maps[i]['createdAt']),
      );
    });
  }

  static Future<void> deleteItem(String id) async {
    final Database db = await DatabaseService.getDatabase();

    await db.delete(
      _table,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<void> insertItem(Item item) async {
    final Database db = await DatabaseService.getDatabase();

    await db.insert(
      _table,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
