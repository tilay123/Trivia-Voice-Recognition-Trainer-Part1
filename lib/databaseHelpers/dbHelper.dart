import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

abstract class DatabaseHelper {

  static Future<sql.Database> createDatabase() async {
    final dbPath = await sql.getDatabasesPath();

    Future<sql.Database> database = sql.openDatabase(
        join(dbPath, "dataKeeper.db"), onCreate: (database, version) {
      return database.execute(
          "CREATE TABLE gameData(id TEXT PRIMARY KEY, coin INT, diamond INT)");
    }, version: 1);

    return database;
  }
}





