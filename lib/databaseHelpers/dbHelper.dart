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
  static const START_TIME = "startTime";
  static const CONTAINER_NAME = "containerName";
  static const REMAINING_PLAY = "canPlayThisManyTimes";
  static const TOTAL_WINS = "totalWins";
  static const TOTAL_LOSES = "totalLoses";
  static const IS_WAITING = "isWaiting";

  static Future<sql.Database> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(join(dbPath, "dataKeeper.db"),
        onCreate: (database, version) async {
      print("Creating Database");

      await database.execute("CREATE TABLE $TABLE(id INTEGER PRIMARY KEY"
          ", $COIN INT, $DIAMOND INT, $TOTAL_WINS INT, $TOTAL_LOSES INT)");

      await database.execute(// 0 FOR FALSE AND 1 FOR TRUE
          "CREATE TABLE $PURCHASE_DATA_TABLE(id INTEGER PRIMARY KEY AUTOINCREMENT"
          ",$CONTAINER_NAME TEXT, $PURCHASED INT, $START_TIME TEXT, $REMAINING_PLAY INT, $IS_WAITING INT)");

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
      "$COIN": 100,
      "$DIAMOND": 5,
      "id": CURRENCY_ID,
      "$TOTAL_WINS": 0,
      "$TOTAL_LOSES": 0,
    });

    _createNewPurchasedDataRow();

//    print("QUERY ${await database.query(TABLE)}");
//    print("QUERY ${await database.query(PURCHASE_DATA)}");
  }

  static Future<void> _createNewPurchasedDataRow() async {
    sql.Database database = await databaseInit();

    for (int i = 0; i < categories.data.length; i++) {
      int tempLength = categories.data[i].length;
      for (int j = 0; j < tempLength; j++) {
        SubCategory temp = categories.data[i][j];
        database.insert(PURCHASE_DATA_TABLE, {
          "$PURCHASED": temp.purchased == true ? 1 : 0,
          //        "START_TIME": "Nothing yet",
          "$CONTAINER_NAME": temp.subCategoryName,
          "$REMAINING_PLAY": 0,
          "$IS_WAITING": temp.isWaiting == true ? 1 : 0,
        });
      }
    }
  }

  static Future<void> updateOnSuccessfulPurchase(String subCategoryName) async {
    sql.Database database = await databaseInit();

    Map<String, Object> dataToUpdate = {"$PURCHASED": 1};

    await database.update(PURCHASE_DATA_TABLE, dataToUpdate,
        where: "$CONTAINER_NAME = ?", whereArgs: [subCategoryName]);
  }

  static Future<List<Map<String, Object>>> getCurrencyData() async {
    sql.Database database = await databaseInit();

    //  print("QUERY1 ${await database.query(TABLE)}");
    //  print("QUERY2 ${await database.query(PURCHASE_DATA_TABLE)}");
    return await database.query(TABLE, columns: [COIN, DIAMOND]);
  }

  static Future<List> getPurchasedDataFor(String subCategoryName) async {
    sql.Database database = await databaseInit();

    List<Map<String, Object>> data = await database.query(PURCHASE_DATA_TABLE,
        columns: [
          PURCHASED,
          START_TIME,
          REMAINING_PLAY,
          CONTAINER_NAME,
          IS_WAITING
        ],
        where: "$CONTAINER_NAME = ?",
        whereArgs: [subCategoryName]);
    print("data00 $data");
    List aList = [];
    aList.add(data[0]["$PURCHASED"] == 1);

    aList.add(data[0]["$START_TIME"]);
    aList.add(data[0]["$REMAINING_PLAY"]);
    aList.add(data[0]["$IS_WAITING"] == 1);

//    aList.forEach((element) {print(element);});
//    print(aList.length);
    //  print("Length:${data.length} data: ${data[0]["$PURCHASED"] == 1}");

    return aList;
  }

//  static Future<List> getPurchasedDataFor2() async {
//    sql.Database database = await databaseInit();
//
//    return await database.query(PURCHASE_DATA_TABLE,
//        columns: [
//          PURCHASED,
//          START_TIME,
//          REMAINING_PLAY,
//          CONTAINER_NAME
//        ],);
//
//  }

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

  static Future<void> updateStartTime(
      DateTime time, String subCategoryName) async {
    sql.Database database = await databaseInit();

    Map<String, Object> newMap = {"$START_TIME": time.toIso8601String()};

    await database.update("$PURCHASE_DATA_TABLE", newMap,
        where: "$CONTAINER_NAME = ?", whereArgs: [subCategoryName]);
  }

  static Future<void> updateRemainingPlay(
      int num, String subCategoryName) async {
    sql.Database database = await databaseInit();
    Map<String, Object> newMap = {"$REMAINING_PLAY": num};
    await database.update("$PURCHASE_DATA_TABLE", newMap,
        where: "$CONTAINER_NAME = ?", whereArgs: [subCategoryName]);
  }

  static Future<void> updateIsWaiting(
      bool isWaiting, String subCategoryName) async {
    sql.Database database = await databaseInit();

    int num = isWaiting == true ? 1 : 0;
    Map<String, Object> dataToUpdate = {"$IS_WAITING": num};

    var app = await database.update(PURCHASE_DATA_TABLE, dataToUpdate,
        where: "$CONTAINER_NAME = ?", whereArgs: [subCategoryName]);
  }
}
