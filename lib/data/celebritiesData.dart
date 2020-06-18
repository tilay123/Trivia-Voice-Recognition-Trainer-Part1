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
final SubCategory singer =
    new SubCategory(subCategoryName: "Singers", questionList: [
  Question(
    questionUrl: "https://firebasestorage.googleapis.com/v0/b/trivia-voice-b2eec.appspot.com/o/Singers%2FjustinBiber.m4a?alt=media&token=15006c4b-dee0-4937-bfbd-7fad6706921a",
    correctAnswer: "Justin Bieber",
    wrongAnswer1: "Drake",
    wrongAnswer2: "Shawn Mendes",
    wrongAnswer3: "Ed Sheeran",
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

//
final SubCategory billionaire =
    new SubCategory(subCategoryName: "Billionaires", questionList: [
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

final SubCategory actorsOrActresses =
    new SubCategory(subCategoryName: "Actors or Actresses", questionList: [
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
