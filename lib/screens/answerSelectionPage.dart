import 'dart:math';

import 'package:animated_button/animated_button.dart'; //it is imported from awesome_dialog
import 'package:flutter/material.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/dataProvider.dart';
import 'package:voicelytrivia/model/question.dart';
import 'package:voicelytrivia/model/subCategory.dart';

import 'package:awesome_dialog/awesome_dialog.dart' hide AnimatedButton;

class AnswerSelectionPage extends StatefulWidget {
  AnswerSelectionPage(this.questionsList);
  final SubCategory questionsList;
  @override
  _AnswerSelectionPageState createState() => _AnswerSelectionPageState();
}

class _AnswerSelectionPageState extends State<AnswerSelectionPage> {
  Question _question;
  List<String> _multipleChoices;
  String _correctAnswer;

  void getMultipleChoice() {
    _question = widget.questionsList.shuffle()[0];
    Random random = Random();

    _multipleChoices = [
      _question.correctAnswer,
      _question.wrongAnswer1,
      _question.wrongAnswer2,
      _question.wrongAnswer3
    ];
    _correctAnswer = _multipleChoices[0];
    _multipleChoices.shuffle(random);
  }

  //PageController _pageController = PageController(initialPage: 0);

  final assetsAudioPlayer = AssetsAudioPlayer();
  int centeredTextTime;

  void play() async {
    try {
//      await assetsAudioPlayer.open(
//        Audio.network(_question.questionUrl),
//      );

      await assetsAudioPlayer.open(
        Audio(_question.questionUrl),
      );






    } catch (t) {
      //mp3 unreachable
    }
  }

  @override
  void initState() {
    super.initState();
    getMultipleChoice();
    play();

    print(" ---------Correct Ans:$_correctAnswer");
  }

  void stopAudio() {
    assetsAudioPlayer.stop();
    assetsAudioPlayer.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    stopAudio();
  }

  void checkUserAnswer(BuildContext context, String submittedAnswerChoice) {
    // print(submittedAnswerChoice);

    stopAudio();

    if (submittedAnswerChoice == _correctAnswer) {
      //    print(submittedAnswerChoice);

      AwesomeDialog(
        //    animType: AnimType.SCALE,
        context: context,
        //    title: "Correct",
        dialogType: DialogType.SUCCES,
        dismissOnTouchOutside: false,
        body: Container(
          height: 80,
          //  color: Co,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "+5",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Image(
                height: 40,
                width: 40,
                image: AssetImage("asset/coin-01.png"),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        btnOk: LayoutBuilder(
          builder: (context, BoxConstraints constraint) {
            print(constraint.maxWidth);
            return AnimatedButton(
              width: constraint.maxWidth - 10,
              child: Text("OK"),
              onPressed: () {
                Provider.of<DataKeeper>(context, listen: false).addCoin(5);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.green,
            );
          },

          //   btnCancel: AnimatedButton(width: -60,child: Text("OK"), onPressed: (){}, color: Colors.green,)
        ),
      ).show();
    } else {
      print("Wrong answer$submittedAnswerChoice");

      AwesomeDialog(
        context: context,
        title: "Wrong",
        dismissOnTouchOutside: false,
        dialogType: DialogType.ERROR,
        //  dismissOnTouchOutside: false,
        body: Container(
          height: 80,
          //  color: Co,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "+1",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Image(
                height: 40,
                width: 40,
                image: AssetImage("asset/coin-01.png"),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        btnOk: LayoutBuilder(
          builder: (context, BoxConstraints constraint) {
            print(constraint.maxWidth);
            return AnimatedButton(
              width: constraint.maxWidth - 10,
              child: Text("OK"),
              onPressed: () {
                Provider.of<DataKeeper>(context, listen: false).addCoin(1);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.green,
            );
          },

          //   btnCancel: AnimatedButton(width: -60,child: Text("OK"), onPressed: (){}, color: Colors.green,)
        ),
      ).show();
    }
  }

  bool finishedAnswering = false;

  @override
  Widget build(BuildContext context) {
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
    //  print("Correct Answer: ${singer.questionList[0].correctAnswer}");

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Stack(
                        children: <Widget>[
                          if (!finishedAnswering)
                            Center(
                              child: TimeCircularCountdown(
                                //strokeWidth: 5,
                                unit: CountdownUnit.second,
                                countdownTotal: 20,
                                strokeWidth: 30,
                                onUpdated: (unit, remainingTime) {
                                  if (!finishedAnswering) {
                                    setState(() {
                                      print(remainingTime);

                                      centeredTextTime = remainingTime;
                                    });
                                  }
                                },
                                onFinished: () {
                                  setState(() {
                                    finishedAnswering = true;
                                    centeredTextTime = 0;
                                  });
                                  print('Countdown finished');
                                },

                                diameter: 100,
                                countdownTotalColor: Colors.red,
                              ),
                            ),
//                        Positioned(
//                            left: 93,
//                            top: 25,
//                            child: Icon(
//                              Icons.pause,
//                              size: 150,
//                            )),

                          Center(
                            child: Icon(
                              finishedAnswering
                                  ? Icons.play_arrow
                                  : Icons.pause,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Time Remaining: ${centeredTextTime.toString()}''",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),

              //  SizedBox(height: 10,),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                margin: EdgeInsets.only(top: 40),
//                height: 200,
//                width: 200,
//                decoration:
//                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//              ),
//            ),
              Container(
                margin: EdgeInsets.all(10),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Listen to the audio clip then determine who the speaker is.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ))),
              ),

              Center(
                child: AnimatedButton(
                  child: Text(_multipleChoices[0]),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {
                    setState(() {
                      finishedAnswering = true;
                    });
                    checkUserAnswer(context, _multipleChoices[0]);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text(_multipleChoices[1]),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {
                    setState(() {
                      finishedAnswering = true;
                    });
                    checkUserAnswer(context, _multipleChoices[1]);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text(_multipleChoices[2]),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {
                    setState(() {
                      finishedAnswering = true;
                    });
                    checkUserAnswer(context, _multipleChoices[2]);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text(_multipleChoices[3]),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {
                    setState(() {
                      finishedAnswering = true;
                    });
                    checkUserAnswer(context, _multipleChoices[3]);
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(5),
        height: 80,
        color: Theme.of(context).scaffoldBackgroundColor,
        //color: Colors.grey[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              color: Provider.of<DataKeeper>(context).getColor(
                  context: context, currentSubCategory: widget.questionsList),
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      Text(
                        "-2 Options",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Price(Currency.COIN, 400),
                ],
              ),
              width: 100,
            ),
            SizedBox(
              width: 10,
            ),
            AnimatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.green[700],
                      ),
                      Text(
                        "Cheat",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Price(Currency.DIAMOND, 1),
                ],
              ),
              width: 100,
              //   height: 50,
              color: Provider.of<DataKeeper>(context).getColor(
                  context: context, currentSubCategory: widget.questionsList),
            ),
          ],
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price(this.currency, this.price);

  final currency;
  final price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$price",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Image(
            height: 20,
            width: 20,
            image: AssetImage(currency == Currency.COIN
                ? "asset/coin-01.png"
                : "asset/diamond-04.png"),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
