import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/question.dart';
import 'package:voicelytrivia/model/subCategory.dart';

//List<String> celebrities = [];
List<SubCategory> tvShows = [
  theAmericans,
  gameOfThrones,
  theBigBangTheory,
  theWalkingDead,
  scandal,
  arrestedDevelopment
];

//1
final SubCategory theAmericans =
    new SubCategory(subCategoryName: "The Americans", currency:Currency.COIN,questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);

//2
final SubCategory gameOfThrones =
    new SubCategory(subCategoryName: "Game of Thrones", price: 1200,currency: Currency.DIAMOND, questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);

//3
final SubCategory theBigBangTheory =
    new SubCategory(subCategoryName: "The Big Bang Theory", questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);

//4
final SubCategory theWalkingDead =
    new SubCategory(subCategoryName: "The Walking Dead", questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);

//5
final SubCategory scandal =
    new SubCategory(subCategoryName: "Scandal", questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);

//6
final SubCategory arrestedDevelopment =
    new SubCategory(subCategoryName: "Arrested Development", questionList: [
  Question(
    questionUrl: "Question URL",
    correctAnswer: "Correct Answer",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL-2",
    correctAnswer: "Correct Answer-2",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
  Question(
    questionUrl: "Question URL3",
    correctAnswer: "Correct Answer3",
    wrongAnswer1: "Wrong Answer 1",
    wrongAnswer2: "Wrong Answer 2",
    wrongAnswer3: "Wrong Answer 3",
  ),
]);
