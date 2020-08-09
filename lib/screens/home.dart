import 'dart:io';
import 'dart:math';

//import 'package:awesome_dialog/awesome_dialog.dart' hide AnimatedButton;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/data/animatedTvShows.dart';
import 'package:voicelytrivia/data/movies.dart';

import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/data/tvShows.dart';
import 'package:animated_button/animated_button.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/screens/answerSelectionPage.dart';
import 'package:voicelytrivia/screens/viewAllPage.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';
import 'package:voicelytrivia/model/dataProvider.dart';
import 'package:voicelytrivia/helpers/popUps.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    Key key,
  }) : super(key: key);

//  Future<void> fetchData(BuildContext context) async {
//    await Provider.of<DataKeeper>(context).fetchAndSetGameCurrency();
//  }

  @override
  Widget build(BuildContext context) {
//    DateTime now = DateTime.now();
//    print(now);
//    DateTime earlier = now.subtract(Duration(hours: 2));
//    print(now);
//    Duration difference = earlier.difference(now);
//    //   print("Difference: ${difference}");
//
//    List aList = [];
//    aList.add(true);
//    aList.add(9090);
//    aList.forEach((element) {
//
//      print(element.runtimeType);});

    //    fetchData(context);

    return FutureBuilder(
      future: Provider.of<DataKeeper>(context).fetchAndSetGameCurrency(),
      builder: (context, snapshot) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // expandedHeight: 100,
              backgroundColor: Color(0xff4281A4),
//          title: Text("Home"),

              actions: <Widget>[
                CoinHolder(),
                DiamondHolder(),
              ],
            ),
            //  SliverToBoxAdapter(child: SizedBox(height: 10,),),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Center(
                  child: AnimatedButton(
//              height: 30,
                    width: 300,
                    color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Play Randomly",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      Random random = new Random();

                      int index = random.nextInt(categories.data.length);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerSelectionPage(
                                  categories.data[index][random.nextInt(
                                      categories.data[index].length)])));
                    },
                  ),
                ),
              ),
            ),

            BigCategoryText(
              title: "Celebrities",
              forViewAllPage: categories.data[0],
              parentIndex: 0,
            ),
            ScrollableRow(
              subCategories: celebrities,
              parentIndex: 0,
            ),
            BigCategoryText(
              title: "TV Shows",
              forViewAllPage: categories.data[1],
              parentIndex: 1,
            ),
            ScrollableRow(
              subCategories: tvShows,
              parentIndex: 1,
            ),
            BigCategoryText(
              title: "Animated TV Shows",
              forViewAllPage: categories.data[2],
              parentIndex: 2,
            ),
            ScrollableRow(
              subCategories: animatedTvShows,
              parentIndex: 2,
            ),
            BigCategoryText(
              title: "Movies",
              forViewAllPage: categories.data[3],
              parentIndex: 3,
            ),
            ScrollableRow(
              subCategories: movies,
              parentIndex: 3,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            )
          ],
        );
      },
    );
  }
}

class BigCategoryText extends StatelessWidget {
  BigCategoryText({this.title, this.forViewAllPage, this.parentIndex});
  final String title;
  final parentIndex;
  final List<SubCategory> forViewAllPage;

//  // #4281A4,  #48A9A6, #E4DFDA, D4B483, C1666B
//  final Color color1 = Color(0xff4281A4);
//  final Color color2 = Color(0xff48A9A6);
//  final Color color3 = Color(0xffE4DFDA);
//  final Color color4 = Color(0xffD4B483);
//  final Color color5 = Color(0xffC1666B);
//  final Color color6 = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff48A9A6),
                  fontWeight: FontWeight.bold),
            ),
            AnimatedButton(
              height: 30,
              width: 80,
              color: Theme.of(context).primaryColor,
              child: Text(
                "View All",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // todo implement this for popup
                        builder: (context) => ViewAllPage(
                              forViewAllPage,
                              parentIndex: parentIndex,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Horizontal scrollable view
class ScrollableRow extends StatefulWidget {
  ScrollableRow({this.subCategories, this.parentIndex});
  final List<SubCategory> subCategories;
  final parentIndex;

  @override
  _ScrollableRowState createState() => _ScrollableRowState();
}

class _ScrollableRowState extends State<ScrollableRow> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 160,
        // color: Colors.red,
        child: ListView.builder(

            // row can't be greater than 5
            itemCount: widget.subCategories?.length == null
                ? 5
                : (widget.subCategories.length > 5
                    ? 5
                    : widget.subCategories.length),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              SubCategory currentSubCategory = widget.subCategories[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 3),
                //  padding: EdgeInsets.all(10),
                width: 200,
                decoration: BoxDecoration(
                  //color: GradientL
                  gradient: LinearGradient(
                      colors: [Color(0xff4568DC), Color(0xffB06AB3)]),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: widget.subCategories?.length == 0
                    ? null
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if (widget.parentIndex > 0)
                            Text(
                              "Identify characters from:",
                              style: TextStyle(color: Colors.white),
                            ),
                          Expanded(
                            child: Center(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        // color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            currentSubCategory.subCategoryName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          HelperTextAndButton(
                            currentSubCategory: currentSubCategory,
                            indexes: [widget.parentIndex, index],
                          ),
                        ],
                      )),
              );
            }),
      ),
    );
  }
}

class HelperTextAndButton extends StatefulWidget {
  const HelperTextAndButton({
    Key key,
    @required this.currentSubCategory,
    @required this.indexes,
  }) : super(key: key);

  final SubCategory currentSubCategory;
  final List indexes;

  @override
  _HelperTextAndButtonState createState() => _HelperTextAndButtonState();
}

class _HelperTextAndButtonState extends State<HelperTextAndButton> {
  @override
  Widget build(BuildContext context) {
    //print("CAT${categories.data[indexes[0]][indexes[1]].remainingPlay}");
    if (widget.currentSubCategory.purchased == false) {
      return Column(
        children: <Widget>[
          Text(
            "Purchase for",
            style: TextStyle(color: Colors.white),
          ),
          BuyButton(
              currentSubCategory: widget.currentSubCategory,
              indexes: [widget.indexes[0], widget.indexes[1]]),
        ],
      );
    } else if (widget.currentSubCategory.isWaiting == true) {
      // && categories.data[indexes[0]][indexes[1]].remainingPlay < 5
      DateTime endTime = widget.currentSubCategory.startTime
          .add(Duration(seconds: 15)); // hours: 2

      if (DateTime.now().isBefore(endTime)) {
        //print(DateTime.now().difference(currentSubCategory.startTime));

        Duration duration = endTime.difference(DateTime.now());

        return CountdownFormatted(
          duration: duration,
          builder: (BuildContext context, String remaining) {
            //print( "currentSubCategory.startTime${currentSubCategory.startTime}");
            DateTime endTime = widget.currentSubCategory.startTime
                .add(Duration(seconds: 15)); //hours: 2
            if (DateTime.now().isBefore(endTime)) {
              //print(DateTime.now().difference(currentSubCategory.startTime));

              return Column(
                children: <Widget>[
                  Text("${endTime.difference(DateTime.now())}",
                      style: TextStyle(color: Colors.white)),
                  BuyButton(
                      currentSubCategory: widget.currentSubCategory,
                      indexes: [widget.indexes[0], widget.indexes[1]]),
                ],
              );
            } else {
              // after timer sets to 0

              //  data.purchased = true; // can't change the copy of the original data.
              categories.data[widget.indexes[0]][widget.indexes[1]].isWaiting =
                  false;
              Provider.of<DataKeeper>(context, listen: false).updateIsWaiting(
                  false, widget.currentSubCategory.subCategoryName);

              categories.data[widget.indexes[0]][widget.indexes[1]]
                  .playedThisManyTimes = 0;
              Provider.of<DataKeeper>(context, listen: false)
                  .updatePlayedThisManyTimes(
                      categories.data[widget.indexes[0]][widget.indexes[1]]
                          .playedThisManyTimes,
                      widget.currentSubCategory.subCategoryName);

              // todo change remaining time vv if DateTime.now().isAfter(endTime)
              return Column(
                children: <Widget>[
                  Text(
                    "Completed: ${widget.currentSubCategory.playedThisManyTimes} /5", // after timer sets to 0
                    style: TextStyle(color: Colors.white),
                  ),
                  playButtonMethod(context)
                ],
              );
            }
          },
        );
      } else {
        print(
            "currentSubCategory.remainingPlay ${widget.currentSubCategory.playedThisManyTimes}");

        return Column(
          children: <Widget>[
            Text(
              "Completed:${widget.currentSubCategory.playedThisManyTimes}/5", // if playable
              style: TextStyle(color: Colors.white),
            ),
            playButtonMethod(context)
          ],
        );
      }
    }
//    return Text(
//      "Completed:${5 - currentSubCategory.remainingPlay}/5, Left: ${currentSubCategory.remainingPlay}",
//      style: TextStyle(color: Colors.white),
//    );
    print(
        "currentSubCategory.remainingPlay ${widget.currentSubCategory.playedThisManyTimes}");

    return Column(
      children: <Widget>[
        Text("Completed:${widget.currentSubCategory.playedThisManyTimes}/5"),
        playButtonMethod(context)
      ],
    );
  }

  AnimatedButton playButtonMethod(BuildContext context) {
    return AnimatedButton(
      onPressed: () async {
//                                    if (currentSubCategory.remainingPlay !=
//                                        null) {
        setState(() {
//                                        categories
//                                            .data[widget.parentIndex][index]
//                                            .remainingPlay--;
          widget.currentSubCategory.playedThisManyTimes++;

          Provider.of<DataKeeper>(context, listen: false)
              .updatePlayedThisManyTimes(
                  widget.currentSubCategory.playedThisManyTimes,
                  widget.currentSubCategory.subCategoryName);

          if (widget.currentSubCategory.playedThisManyTimes == 5) {
            // categories.data[widget.parentIndex][index].remainingPlay = 5;
            print(
                "remainingPlay is five 5 ${widget.currentSubCategory.playedThisManyTimes}");
            //    currentSubCategory.isWaiting = true;
            categories.data[widget.indexes[0]][widget.indexes[1]].isWaiting =
                true;

            print(
                "currentSubCategory.isWaiting = true;${widget.currentSubCategory.isWaiting = true}");

            Provider.of<DataKeeper>(context, listen: false).updateIsWaiting(
                widget.currentSubCategory.isWaiting,
                widget.currentSubCategory.subCategoryName);

            setState(() {
              widget.currentSubCategory.startTime = DateTime.now();
              Provider.of<DataKeeper>(context, listen: false).updateStartTime(
                  widget.currentSubCategory.startTime,
                  widget.currentSubCategory.subCategoryName);
            });
          }
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AnswerSelectionPage(widget.currentSubCategory)));
      },
      color: Colors.green[500],
      width: 180,
      height: 40,
      child: Text(
        "PLAY",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BuyButton extends StatefulWidget {
  const BuyButton({
    Key key,
    @required this.currentSubCategory,
    @required this.indexes,
  }) : super(key: key);

  final List indexes;
  final SubCategory currentSubCategory;

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    int currentCoins = Provider.of<DataKeeper>(context, listen: false).getCoin;
    int currentDiamonds =
        Provider.of<DataKeeper>(context, listen: false).getDiamond;

    if (widget.currentSubCategory.isWaiting == true) {
      return AnimatedButton(
        // will br great disabled button color 0xff82c4c3
        //  color: currentSubCategory.currency == Currency.COIN? Color(0xff53b8b8): Color(0xff22a1e0),
        color: Provider.of<DataKeeper>(context).getColor(
            context: context, currentSubCategory: widget.currentSubCategory),
        width: 180,
        height: 40,
        onPressed: () {
          //  showVPopup(context, widget.currentSubCategory, widget.indexes,);

          setState(() {
            categories.data[widget.indexes[0]][widget.indexes[1]]
                .playedThisManyTimes = 0;

            Provider.of<DataKeeper>(context, listen: false)
                .updatePlayedThisManyTimes(
                    categories.data[widget.indexes[0]][widget.indexes[1]]
                        .playedThisManyTimes,
                    widget.currentSubCategory.subCategoryName);

            widget.currentSubCategory.isWaiting = false;

            Provider.of<DataKeeper>(context, listen: false).updateIsWaiting(
                false, widget.currentSubCategory.subCategoryName);

            Provider.of<DataKeeper>(context, listen: false).addDiamond(-1);
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${1}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Image(
              height: 30,
              width: 30,
              image: AssetImage("asset/diamond-04.png"),
            ),
          ],
        ),
      );
    }

// else
    return AnimatedButton(
      // will br great disabled button color 0xff82c4c3
      //  color: currentSubCategory.currency == Currency.COIN? Color(0xff53b8b8): Color(0xff22a1e0),
      color: Provider.of<DataKeeper>(context).getColor(
          context: context, currentSubCategory: widget.currentSubCategory),
      width: 180,
      height: 40,
      onPressed: () {
        //  showVPopup(context, widget.currentSubCategory, widget.indexes,);

        showValidatorPopup(context, widget.currentSubCategory, widget.indexes,
            setStateFunction: () {
          setState(() {
            //  data.purchased = true; // can't change the copy of the original data.
            categories.data[widget.indexes[0]][widget.indexes[1]].purchased =
                true;
            categories.data[widget.indexes[0]][widget.indexes[1]]
                .playedThisManyTimes = 0;
            Provider.of<DataKeeper>(context, listen: false)
                .updatePlayedThisManyTimes(
                    categories.data[widget.indexes[0]][widget.indexes[1]]
                        .playedThisManyTimes,
                    widget.currentSubCategory.subCategoryName);
          });
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${widget.currentSubCategory.price == null ? 500 : widget.currentSubCategory.price}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Image(
            height: 30,
            width: 30,
            image: AssetImage(
                widget.currentSubCategory.currency == Currency.COIN
                    ? "asset/coin-01.png"
                    : "asset/diamond-04.png"),
          ),
        ],
      ),
    );
  }
}
