import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart' hide AnimatedButton;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/data/animatedTvShows.dart';
import 'package:voicelytrivia/data/movies.dart';

import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/data/tvShows.dart';
import 'package:voicelytrivia/model/constants.dart';
import 'package:animated_button/animated_button.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/screens/answerSelectionPage.dart';
import 'package:voicelytrivia/screens/viewAllPage.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';
import 'package:voicelytrivia/model/dataProvider.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DataKeeper>(context, listen: false)
          .fetchAndSetGameCurrency(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

//        // todo change this initial addition
//        Provider.of<DataKeeper>(context, listen: false).addCoin(1000);
//        Provider.of<DataKeeper>(context, listen: false).addDiamond(1000);
//
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // expandedHeight: 100,
              backgroundColor: Color(0xff4281A4),
//          title: Text("Home"),

              actions: <Widget>[
                CoinHolder(),
                DiamondHolder(),
//TODO COIN DATA
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
                      Random random = Random();

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
            ),
            ScrollableRow(
              subCategories: celebrities,
              parentIndex: 0,
            ),
            BigCategoryText(
              title: "TV Shows",
              forViewAllPage: categories.data[1],
            ),
            ScrollableRow(
              subCategories: tvShows,
              parentIndex: 1,
            ),
            BigCategoryText(
              title: "Animated TV Shows",
              forViewAllPage: categories.data[2],
            ),
            ScrollableRow(
              subCategories: animatedTvShows,
              parentIndex: 2,
            ),
            BigCategoryText(
              title: "Movies",
              forViewAllPage: categories.data[3],
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
  BigCategoryText({this.title, this.forViewAllPage});
  final String title;

  final List<SubCategory> forViewAllPage;

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
                  fontSize: 20, color: color2, fontWeight: FontWeight.bold),
            ),
            AnimatedButton(
              height: 30,
              width: 80,
              color: color1,
              child: Text(
                "View All",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onPressed: () {
                // todo viewAll Page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllPage(forViewAllPage)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Horizontal scrollable view
class ScrollableRow extends StatelessWidget {
  ScrollableRow({this.subCategories, this.parentIndex});
  final List<SubCategory> subCategories;
  final parentIndex;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        // color: Colors.red,
        child: ListView.builder(

            // row can't be greater than 5
            itemCount: subCategories?.length == null
                ? 5
                : (subCategories.length > 5 ? 5 : subCategories.length),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              SubCategory currentSubCategory = subCategories[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 3),
                //  padding: EdgeInsets.all(10),
                width: 180,
                decoration: BoxDecoration(
                  //color: GradientL
                  gradient: LinearGradient(
                      colors: [Color(0xff4568DC), Color(0xffB06AB3)]),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: subCategories?.length == 0
                    ? null
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                currentSubCategory.subCategoryName,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            "0/5, left: 5",
                            style: TextStyle(color: Colors.white),
                          ),
                          currentSubCategory.purchased == true
                              ? AnimatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AnswerSelectionPage(
                                                    currentSubCategory)));
                                  },
                                  color: Colors.green[500],
                                  width: 160,
                                  height: 40,
                                  child: Text(
                                    "PLAY",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : BuyButton(
                                  currentSubCategory: currentSubCategory,
                                  indexes: [parentIndex, index]),
                        ],
                      )),
              );
            }),
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
  void showPopup(BuildContext context, SubCategory data, List indexes ) {
    // todo change original data
    bool canPurchase = Provider.of<DataKeeper>(context, listen: false)
        .canPurchase(widget.currentSubCategory);

    if (!canPurchase) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          btnOk: Center(
            child: AnimatedButton(
              child: Text("OK"),
              onPressed: () {
                // Provider.of<DataKeeper>(context, listen: false).addCoin(100);
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            height: 100,
            color: Colors.purple,
            child: Text(
              "Not Enough coin",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )).show();
    } else {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          btnOk: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: AnimatedButton(
                  color: Colors.green,
                  width: constraints.maxWidth - 5,
                  child: Text("CONFIRM"),
                  onPressed: () async {
                    bool successPurchase;

                    if (data.currency == Currency.COIN) {
                      successPurchase =
                          await Provider.of<DataKeeper>(context, listen: false)
                              .addCoin(-data.price);
                    } else if (data.currency == Currency.DIAMOND) {
                      successPurchase =
                          await Provider.of<DataKeeper>(context, listen: false)
                              .addDiamond(-data.price);
                    }

                    if (successPurchase) {
                      setState(() {
                        print("Purchased");
                      //  data.purchased = true; // can't change the copy of the original data.
                        categories.data[indexes[0]][indexes[1]].purchased = true;

                      });

                      Navigator.pop(context);

                      await Provider.of<DataKeeper>(context,listen: false)
                          .updatePurchaseDatabase(
                              widget.currentSubCategory.subCategoryName);
                      Random random = Random();

                      int index = random.nextInt(categories.data.length);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerSelectionPage(
                                  categories.data[index][random.nextInt(
                                      categories.data[index].length)])));
                    }
                  },
                ),
              );
            },
          ),
          btnCancel: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: AnimatedButton(
                  color: Colors.red,
                  width: constraints.maxWidth - 5,
                  child: Text("CANCEL"),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
          body: Container(
            height: 100,
            color: Colors.purple,
          )).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentCoins = Provider.of<DataKeeper>(context, listen: false).getCoin;
    int currentDiamonds =
        Provider.of<DataKeeper>(context, listen: false).getDiamond;

    Color getColor() {
      bool canPurchase = Provider.of<DataKeeper>(context,listen: false)
          .canPurchase(widget.currentSubCategory);

      print("$currentCoins and $currentDiamonds");
      if (!canPurchase) {
        return Colors.grey[400];
      } else if (widget.currentSubCategory.currency == Currency.COIN) {
        return Color(0xff53b8b8);
      } else if (widget.currentSubCategory.currency == Currency.DIAMOND) {
        // must be Diamond
        return Color(0xff22a1e0);
      }
      // todo there's null currency
      return Colors.grey[400];
    }

    return AnimatedButton(
      // will br great disabled button color 0xff82c4c3
      //  color: currentSubCategory.currency == Currency.COIN? Color(0xff53b8b8): Color(0xff22a1e0),
      color: getColor(),
      width: 160,
      height: 40,
      onPressed: () {
        showPopup(context, widget.currentSubCategory, widget.indexes);
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
