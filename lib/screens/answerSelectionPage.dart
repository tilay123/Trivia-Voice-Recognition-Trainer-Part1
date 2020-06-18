import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';
import 'package:voicelytrivia/model/dataProvider.dart';


class AnswerSelectionPage extends StatefulWidget {
  @override
  _AnswerSelectionPageState createState() => _AnswerSelectionPageState();
}

class _AnswerSelectionPageState extends State<AnswerSelectionPage> {
  //PageController _pageController = PageController(initialPage: 0);

  final assetsAudioPlayer = AssetsAudioPlayer();
  int centeredTextTime;

  void play()async{
    try {
      await assetsAudioPlayer.open(
        Audio.network("https://firebasestorage.googleapis.com/v0/b/voicely-trivia.appspot.com/o/singers%2FNee%20Kannulu%20Full%20Video%20Song%20(4K)%20Savaari%20Songs%20Shekar%20Chandra%20Nandu%2C%20Priyanka%20Sharma.mp3?alt=media&token=b71e8f85-89e9-4b53-b84f-005b9e271125"),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   assetsAudioPlayer.stop();
   assetsAudioPlayer.dispose();
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
