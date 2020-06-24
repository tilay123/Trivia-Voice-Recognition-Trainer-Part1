import 'package:voicelytrivia/model/currency.dart';

import 'question.dart';
import 'subCategoryType.dart';
import 'dart:math';

class SubCategory {
  SubCategory(
      {this.subCategoryName,
      this.questionList,
      this.price,
      this.currency,
      this.purchased});
  String subCategoryName; // Singer, Movie names,
  List<Question> questionList;
  bool purchased = false;
  int price = 500;
  Currency currency = Currency.COIN;

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
