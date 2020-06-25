import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/model/subCategory.dart';

abstract class DatabaseHelper {
  static const COIN = "COIN";
  static const DIAMOND = "DIAMOND";
  // static const CURRENCY_ID = "CURRENCY_ID";
  // static const PURCHASE_ID = "PURCHASE_ID";
  static const TABLE = "gameData";
  static const PURCHASE_DATA_TABLE = "purchasedDataTable";
  static const CURRENCY_ID = 1;
  static const PURCHASED = "purchased";
  static const TIME_REMAINING = "timeRemaining";
  static const CONTAINER_NAME = "containerName";

  static Future<sql.Database> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(join(dbPath, "dataKeeper.db"),
        onCreate: (database, version) async {
      print("Creating Database");

      await database.execute("CREATE TABLE $TABLE(id INTEGER PRIMARY KEY"
          ", $COIN INT, $DIAMOND INT)");

      await database.execute(// 0 FOR FALSE AND 1 FOR TRUE
          "CREATE TABLE $PURCHASE_DATA_TABLE(id INTEGER PRIMARY KEY AUTOINCREMENT"
          ",$CONTAINER_NAME TEXT, $PURCHASED INT, $TIME_REMAINING TEXT)");

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
      "id": CURRENCY_ID,
    });

    createNewPurchasedDataRow();

//    print("QUERY ${await database.query(TABLE)}");
//    print("QUERY ${await database.query(PURCHASE_DATA)}");
  }

  static Future<void> createNewPurchasedDataRow() async {
    sql.Database database = await databaseInit();

    for (int i = 0; i < categories.data.length; i++) {
      int tempLength = categories.data[i].length;
      for (int j = 0; j < tempLength; j++) {
        SubCategory temp = categories.data[i][j];
        database.insert(PURCHASE_DATA_TABLE, {
          "$PURCHASED": temp.purchased == true ? 1 : 0,
          "$TIME_REMAINING": "Nothing yet",
          "$CONTAINER_NAME": temp.subCategoryName,
        });
      }
    }
  }

  static Future<List<Map<String, Object>>> getData() async {
    sql.Database database = await databaseInit();

    //  print("QUERY1 ${await database.query(TABLE)}");
    //  print("QUERY2 ${await database.query(PURCHASE_DATA_TABLE)}");
    return await database.query(TABLE, columns: [COIN, DIAMOND]);
  }

  static Future<bool> getPurchasedDataFor(String subCategoryName) async {
    sql.Database database = await databaseInit();

    List<Map<String, Object>> data = await database.query(PURCHASE_DATA_TABLE,
        columns: [
          PURCHASED,
        ],
        where: "$CONTAINER_NAME = ?",
        whereArgs: [subCategoryName]);

    //  print("Length:${data.length} data: ${data[0]["$PURCHASED"] == 1}");

    return data[0]["$PURCHASED"] == 1;
  }

  static Future<void> replaceCurrency(String currency, int num) async {
    sql.Database database = await databaseInit();

//    Map<String,dynamic > rowToUpdate = (await database.query(TABLE))[0];

    Map<String, dynamic>
        rowToUpdate; // creating new row to put it in existing database as an update

    if (currency == COIN) {
      rowToUpdate = {"$COIN": num};
      database.update(TABLE, rowToUpdate,
          where: "id = ?", whereArgs: [CURRENCY_ID]);
    } else if (currency == DIAMOND) {
      rowToUpdate = {"$DIAMOND": num};
      database.update(TABLE, rowToUpdate,
          where: "id = ?", whereArgs: [CURRENCY_ID]);
    }
  }
}
