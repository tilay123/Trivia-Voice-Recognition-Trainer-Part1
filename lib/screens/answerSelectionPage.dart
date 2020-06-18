import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';


class AnswerSelectionPage extends StatefulWidget {
  @override
  _AnswerSelectionPageState createState() => _AnswerSelectionPageState();
}

class _AnswerSelectionPageState extends State<AnswerSelectionPage> {
  //PageController _pageController = PageController(initialPage: 0);

  int centeredTextTime;
  final assetsAudioPlayer = AssetsAudioPlayer();

  void play()async{
    try {
      await assetsAudioPlayer.open(
        Audio.network("https://firebasestorage.googleapis.com/v0/b/trivia-voice-b2eec.appspot.com/o/Singers%2FjustinBiber.m4a?alt=media&token=15006c4b-dee0-4937-bfbd-7fad6706921a"),
      );
    } catch (t) {
      //mp3 unreachable
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play();
  }



  @override
  Widget build(BuildContext context) {
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
//    print("Wrong Answer: ${singer.subCategories[0].getWrongAnswer()}");
    print("Correct Answer: ${singer.questionList[0].correctAnswer}");

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
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
                      height: 200,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: TimeCircularCountdown(
                              //strokeWidth: 5,
                              unit: CountdownUnit.second,
                              countdownTotal: 20,
                              strokeWidth: 30,
                              onUpdated: (unit, remainingTime) {
                                setState(() {
                                  print(remainingTime);
                                  // print("Hi");

                                  centeredTextTime = remainingTime;
                                });
                              },
                              onFinished: () {
                                setState(() {
                                  centeredTextTime = 0;
                                });
                                print('Countdown finished');
                              },
                              diameter: 200,
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
                              Icons.pause,
                              size: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Time Remaining: ${centeredTextTime.toString()}''",
                      style: TextStyle(fontSize: 30),
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
                margin:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
              ),

              Center(
                child: AnimatedButton(
                  child: Text("Hello1"),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: ()  {




                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text("Hello2"),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text("Hello3"),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedButton(
                  child: Text("Hello4"),
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width - 60,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
