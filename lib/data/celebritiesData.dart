import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/question.dart';
import 'package:voicelytrivia/model/category.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/model/subCategoryType.dart';

//List<String> celebrities = [];
List<SubCategory> celebrities = [
  singer,
  billionaire,
  presidents,
  motivators,
  actorsOrActresses,
];

// Hello man
final SubCategory singer = new SubCategory(
    subCategoryName: "Singers",
    price: 300,
    purchased: true,
    currency: Currency.COIN,
    questionList: [
      Question(
        questionUrl:
            "https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/Celebraties%2FSingers%2FjustinBieber.m4a?alt=media&token=339a1e21-49af-45ec-af52-9c49b80ef9ea",
        correctAnswer: "Justin Bieber",
        wrongAnswer1: "Drake",
        wrongAnswer2: "Shawn Mendes",
        wrongAnswer3: "Ed Sheeran",
      ),

      Question(
        questionUrl:
            "https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/Celebraties%2FSingers%2FBeyonce%CC%81.m4a?alt=media&token=858612e2-453e-441e-b7e9-7370ea8f8515",
        correctAnswer: "Beyoncé",
        wrongAnswer1: "Lady Gaga",
        wrongAnswer2: "Ariana Grande",
        wrongAnswer3: "Selena Gomez",
      ),
      Question(
        questionUrl:
            "https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/Celebraties%2FSingers%2FMariah%20Carey-Fe.m4a?alt=media&token=b3542f18-bf9e-404b-be52-893b38633583",
        correctAnswer: "Micah Carey",
        wrongAnswer3: "Beyoncé",
        wrongAnswer1: "Lady Gaga",
        wrongAnswer2: "Ariana Grande",
      ),
      Question(
        questionUrl:
            "https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/Celebraties%2FSingers%2FMichael%20Jackson.m4a?alt=media&token=210a742d-e548-4058-84d5-3aa7464b8696",
        correctAnswer: "Michael Jackson",
        wrongAnswer1: "Rick Ross",
        wrongAnswer2: "Ed Sheeran",
        wrongAnswer3: "Lil Wayne",
      ),
//      Question(
//        questionUrl: "Question URL",
//        correctAnswer: "Correct Answer",
//        wrongAnswer1: "Wrong Answer 1",
//        wrongAnswer2: "Wrong Answer 2",
//        wrongAnswer3: "Wrong Answer 3",
//      ),
//
    ]);

//
final SubCategory billionaire = new SubCategory(
    price: 1000,
    currency: Currency.DIAMOND,
    purchased: true,
    subCategoryName: "Billionaires",
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

final SubCategory presidents =
    new SubCategory(subCategoryName: "Presidents", questionList: [
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

final SubCategory motivators =
    new SubCategory(subCategoryName: "Motivators", questionList: [
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

final SubCategory actorsOrActresses = new SubCategory(
    price: 400,
    subCategoryName: "Actors or Actresses",
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
