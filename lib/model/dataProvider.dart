import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/databaseHelpers/dbHelper.dart';
import 'package:voicelytrivia/model/subCategory.dart';

import 'currency.dart';

class DataKeeper extends ChangeNotifier {
  int _currentIndex = 0;

  int _coin = 0;
  int _diamond = 0;
  int _totalWin = 0;
  int _totalLoses = 0;


  int get getCoin {
    return _coin;
  }

  int get totalWins {
    return _totalWin;
  }
  int get totalLoses {
    return _totalLoses;
  }

  Future<bool> addCoin(int amount) async {
    if (_coin + amount < 0) {
      return false;
    }
    _coin += amount;
    notifyListeners();
    //  DatabaseHelper.update("gameData", {"coin": _coin});
    await DatabaseHelper.replaceCurrency(DatabaseHelper.COIN, _coin);
    return true;
  }

  int get getDiamond {
    return _diamond;
  }

  bool canPurchase(SubCategory data) {
    if (data.currency == Currency.COIN && getCoin >= data.price ||
        data.currency == Currency.DIAMOND && getDiamond >= data.price) {
      return true;
    }

    return false;
  }

  Color getColor(
      {@required BuildContext context,
      @required SubCategory currentSubCategory}) {
    bool canPurchase = this.canPurchase(currentSubCategory);

    //print("$currentCoins and $currentDiamonds");
    if (!canPurchase) {
      return Colors.grey[400];
    } else if (currentSubCategory.currency == Currency.COIN) {
      return Color(0xff53b8b8);
    } else if (currentSubCategory.currency == Currency.DIAMOND) {
      // must be Diamond
      return Color(0xff22a1e0);
    }
    return Colors.grey[400];
  }

  Duration getDuration(SubCategory currentSubCategory) {
    DateTime endTime = currentSubCategory.startTime.add(Duration(hours: 2));

    if (DateTime.now().isBefore(endTime)) {
      //print(DateTime.now().difference(currentSubCategory.startTime));

      return endTime.difference(DateTime.now());
    }
    return Duration(seconds: 10);
  }

  Future<void> updatePurchaseDatabase(String subcategoryName) async {
    await DatabaseHelper.updateOnSuccessfulPurchase(subcategoryName);
    notifyListeners();
  }

  Future<bool> addDiamond(int amount) async {
    if (_diamond + amount < 0) {
      return false;
    }
    _diamond += amount;

    //   DatabaseHelper.update("gameData", {"diamond": _diamond});
    await DatabaseHelper.replaceCurrency(DatabaseHelper.DIAMOND, _diamond);
    notifyListeners();
    return true;
  }

  int get getHomePageCurrentIndex {
    return _currentIndex;
  }

  void setCurrentIndex(int x) {
    _currentIndex = x;
    notifyListeners();
  }

  int _centerText = 15;
  int get getCenterText {
    return _centerText;
  }

  set setCenterText(int num) {
    _centerText = num;
    notifyListeners();
  }

  Future<void> fetchAndSetGameCurrency() async {
    List<Map<String, Object>> gameData = await DatabaseHelper.getCurrencyData();

    print("Game data  $gameData ${gameData.length}");
//    print(   gameData.map((element) {
//
//    }).toList());

    if (gameData.length == 0) {
      DatabaseHelper.createNewRow();
      notifyListeners();

    } else {
      print("data not null fetching row...");
      _coin = gameData[0]["${DatabaseHelper.COIN}"];
      _diamond = gameData[0]["${DatabaseHelper.DIAMOND}"];
      //getting purchased data from database
      for (int outer = 0; outer < categories.data.length; outer++) {
        int tempLength = categories.data[outer].length;
        for (int j = 0; j < tempLength; j++) {
          SubCategory temp = categories.data[outer][j];

          List listOfData =
              await DatabaseHelper.getPurchasedDataFor(temp.subCategoryName);


          categories.data[outer][j].purchased =  listOfData[0];
          categories.data[outer][j].startTime =  DateTime.parse(listOfData[1]);
          categories.data[outer][j].remainingPlay =  listOfData[2];
          // print("working on setting up purchased to true or false ");
          print("List OF List $listOfData");
        }
      }

      print("GAME_DATA: $gameData");
//      gameData[0].forEach((key, value) {
//        if (key == DatabaseHelper.COIN) {
//          _coin = value;
//        } else if (key == DatabaseHelper.DIAMOND) {
//          _diamond = value;
//        }
//      });

    //  notifyListeners();
    }
  }
}
