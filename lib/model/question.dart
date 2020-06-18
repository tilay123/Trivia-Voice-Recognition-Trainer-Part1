import 'package:flutter/cupertino.dart';

class Question {
  Question({
    @required this.questionUrl,
    @required this.correctAnswer,
    @required this.wrongAnswer1,
    @required this.wrongAnswer2,
    @required this.wrongAnswer3,
  });

  String questionUrl;
  String correctAnswer;
  String wrongAnswer1;
  String wrongAnswer2;
  String wrongAnswer3;
}
