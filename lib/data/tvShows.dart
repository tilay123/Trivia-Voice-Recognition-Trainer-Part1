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
final SubCategory theAmericans = new SubCategory(
    subCategoryName: "The Americans",
    startTime: DateTime.now(),
    currency: Currency.COIN,
    price: 200,
    questionList: [
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
final SubCategory gameOfThrones = new SubCategory(
    subCategoryName: "Game of Thrones",
    price: 2,
    currency: Currency.DIAMOND,
    questionList: [
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
final SubCategory theBigBangTheory = new SubCategory(
    subCategoryName: "The Big Bang Theory",
    currency: Currency.COIN,
    price: 250,
    questionList: [
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
final SubCategory theWalkingDead = new SubCategory(
    subCategoryName: "The Walking Dead",
    currency: Currency.COIN,
    price: 400,
    questionList: [
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
final SubCategory scandal = new SubCategory(
    subCategoryName: "Scandal",
    currency: Currency.COIN,
    price: 300,
    questionList: [
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
final SubCategory arrestedDevelopment = new SubCategory(
    subCategoryName: "Arrested Development",
    currency: Currency.COIN,
    price: 150,
    questionList: [
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
