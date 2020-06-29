import 'package:flutter/cupertino.dart';
import 'package:voicelytrivia/model/currency.dart';

import 'question.dart';
import 'subCategoryType.dart';
import 'dart:math';

class SubCategory {
  SubCategory({
    @required this.subCategoryName,
    @required this.questionList,
    @required this.price,
    @required this.currency,
    this.purchased,
    this.startTime,
    this.playedThisManyTimes,
    this.isWaiting,
  });
  String subCategoryName; // Singer, Movie names,
  List<Question> questionList;
  bool purchased = false;
  int price = 500;
  Currency currency = Currency.COIN;
  DateTime startTime;
  int playedThisManyTimes;
  bool isWaiting = false;

  List<Question> shuffle() {
    var random = new Random();

    // Go through all elements.
    for (var i = questionList.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = questionList[i];
      questionList[i] = questionList[n];
      questionList[n] = temp;
    }

    return questionList;
  }
}
