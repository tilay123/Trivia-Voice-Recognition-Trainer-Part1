import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:voicelytrivia/databaseHelpers/dbHelper.dart';

class DataKeeper extends ChangeNotifier {
  int _currentIndex = 0;

  int _coin = 0;
  int _diamond = 0;

  int get getCoin {
    return _coin;
  }

  void addCoin(int amount) async {
    _coin += amount;
    notifyListeners();
    //  DatabaseHelper.update("gameData", {"coin": _coin});
    await DatabaseHelper.addCurrency(DatabaseHelper.COIN, _coin);
  }

  int get getDiamond {
    return _diamond;
  }

  void addDiamond(int amount) async {
    _diamond += amount;

    //   DatabaseHelper.update("gameData", {"diamond": _diamond});
    await DatabaseHelper.addCurrency(DatabaseHelper.DIAMOND, _diamond);
    notifyListeners();
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
    List<Map<String, Object>> gameData = await DatabaseHelper.getData();

    print("Game data  $gameData ${gameData.length}");
//    print(   gameData.map((element) {
//
//    }).toList());

    if (gameData.length == 0) {
      print("data null creating row...");
      DatabaseHelper.createNewRow();
      //   notifyListeners();
    } else {
      gameData[0].forEach((key, value) {
        if (key == DatabaseHelper.COIN) {
          _coin = value;
        } else if (key == DatabaseHelper.DIAMOND) {
          _diamond = value;
        }
      });
    }
  }
}
