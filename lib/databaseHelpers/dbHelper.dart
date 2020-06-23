import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/model/subCategory.dart';

abstract class DatabaseHelper {
  static const COIN = "COIN";
  static const DIAMOND = "DIAMOND";
  static const ID = "ID";
  static const TABLE = "gameData";
  static const PURCHASE_DATA = "purchasedData";
  static const COIN_ID = 1;
  static const DIAMOND_ID = 1;
  static const PURCHASED = "purchased";
  static const TIME_REMAINING = "timeRemaining";
  static const CONTAINER_NAME = "containerName";

  static Future<sql.Database> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(join(dbPath, "dataKeeper.db"),
        onCreate: (database, version) async {
      print("Creating Database");

      await database.execute( // 0 FOR FALSE AND 1 FOR TRUE
          "CREATE TABLE $PURCHASE_DATA($ID INTEGER PRIMARY KEY AUTOINCREMENT"
          ",$CONTAINER_NAME TEXT, $PURCHASED INT, $TIME_REMAINING TEXT)");

      await database
          .execute("CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY AUTOINCREMENT"
              ", $COIN INT, $DIAMOND INT)");
      return database;
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
    createNewPurchasedDataRow();

//    print("QUERY ${await database.query(TABLE)}");
//    print("QUERY ${await database.query(PURCHASE_DATA)}");
  }

  static Future<void> createNewPurchasedDataRow() async {
    sql.Database database = await databaseInit();

    for (int i = 0; i < categories.data.length; i++) {

      int tempLength = categories.data[i].length;
      for (int j = 0; j < tempLength; j++){
        SubCategory temp =categories.data[i][j];
        database.insert(PURCHASE_DATA, {
        "$PURCHASED": temp.purchased == true? 1: 0,
        "$TIME_REMAINING": "Nothing yet",
          "$CONTAINER_NAME": temp.subCategoryName,
        });
      }


    }
  }

  static Future<List<Map<String, Object>>> getData() async {
    sql.Database database = await databaseInit();

    print("QUERY1 ${await database.query(TABLE)}");
    print("QUERY2 ${await database.query(PURCHASE_DATA)}");
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
