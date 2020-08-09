import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/question.dart';
import 'package:voicelytrivia/model/subCategory.dart';

//List<String> celebrities = [];
List<SubCategory> celebrities = [
  singer,
  motivators,
  billionaire,
  presidents,
  actorsOrActresses,
];

// Hello man
final SubCategory singer = new SubCategory(
    subCategoryName: "Singers",
    price: 100,
    currency: Currency.COIN,
    questionList: [
      Question(
        questionUrl: "asset/audios/celeb/singers/justinBieber.m4a",
        correctAnswer: "Justin Bieber",
        wrongAnswer1: "Drake",
        wrongAnswer2: "Shawn Mendes",
        wrongAnswer3: "Ed Sheeran",
      ),

      Question(
        questionUrl: "asset/audios/celeb/singers/SelenaGomez.mp3",
        wrongAnswer3: "Beyoncé",
        wrongAnswer1: "Lady Gaga",
        wrongAnswer2: "Ariana Grande",
        correctAnswer: "Selena Gomez",
      ),
      Question(
        questionUrl: "asset/audios/celeb/singers/CardiB.mp3",
        correctAnswer: "Cardi B",
        wrongAnswer3: "Beyoncé",
        wrongAnswer1: "Lady Gaga",
        wrongAnswer2: "Ariana Grande",
      ),
//      Question(     // Link not working
//        questionUrl:
//            "https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/Celebraties%2FSingers%2FMichael%20Jackson.m4a?alt=media&token=210a742d-e548-4058-84d5-3aa7464b8696",
//        correctAnswer: "Michael Jackson",
//        wrongAnswer1: "Rick Ross",
//        wrongAnswer2: "Ed Sheeran",
//        wrongAnswer3: "Lil Wayne",
//      ),
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
    price: 5,
    currency: Currency.DIAMOND,
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

final SubCategory presidents = new SubCategory(
    subCategoryName: "Politicians",
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

final SubCategory motivators = new SubCategory(
    subCategoryName: "Motivators",
    currency: Currency.DIAMOND,
    price: 4,
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

final SubCategory actorsOrActresses = new SubCategory(
    price: 250,
    currency: Currency.COIN,
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
