import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

abstract class DatabaseHelper {
  static const COIN = "COIN";
  static const DIAMOND = "DIAMOND";
  static const ID = "ID";
  static const TABLE = "gameData";
  static const COIN_ID = 1;
  static const DIAMOND_ID = 1;

  static Future<sql.Database> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(join(dbPath, "dataKeeper.db"),
        onCreate: (database, version) async {
          print("Creating Database");
          return await database
              .execute(
              "CREATE TABLE gameData($ID INTEGER PRIMARY KEY AUTOINCREMENT"
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
      "id": COIN_ID,
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

    Map<String, dynamic>
    rowToUpdate; // creating new row to put it in existing database as an update

    if (currency == COIN) {
      rowToUpdate = {"$COIN": num};
      database
          .update(TABLE, rowToUpdate, where: "id = ?", whereArgs: [COIN_ID]);
    } else if (currency == DIAMOND) {
      rowToUpdate = {"$COIN": num};
      database
          .update(TABLE, rowToUpdate, where: "id = ?", whereArgs: [DIAMOND_ID]);
    }
  }
}

