import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

abstract class DatabaseHelper {
  static const COIN = "COIN";
  static const DIAMOND = "DIAMOND";
  static const ID = "ID";
  static const TABLE = "gameData";

  static Future<sql.Database> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(join(dbPath, "dataKeeper.db"),
        onCreate: (database, version) async {
      print("Creating Database");
      return await database
          .execute("CREATE TABLE gameData($ID INTEGER PRIMARY KEY AUTOINCREMENT"
              ", $COIN INT, $DIAMOND INT)");
    }, version: 1);
  }

//  static void insert(String tableName, Map<String, Object> data) async {
//    sql.Database database = await databaseInit();
//
//    database.insert(tableName, data,
//        conflictAlgorithm: sql.ConflictAlgorithm.replace);
//  }

  static Future<void> createNewRow() async {
    sql.Database database = await databaseInit();

    database.insert(TABLE, {
      "$COIN": 20,
      "$DIAMOND": 5,

    });

    print("QUERY ${await database.query(TABLE)}");
  }

  static Future<List<Map<String, Object>>> getData() async {
    sql.Database database = await databaseInit();
    return await database.query(TABLE, columns: [COIN, DIAMOND]);
  }

  static Future<void> addCurrency(String currency, int num) async {
    sql.Database database = await databaseInit();

//    Map<String,dynamic > rowToUpdate = (await database.query(TABLE))[0];

    if (currency == COIN) {
      database.update(TABLE, {});
    } else if (currency == DIAMOND) {
      database.update(TABLE, {}, where: "$COIN = ?", whereArgs: [num]);
    }
  }
}
