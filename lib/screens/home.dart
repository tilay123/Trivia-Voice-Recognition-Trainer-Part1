import 'dart:math';

import 'package:flutter/material.dart';
import 'package:voicelytrivia/data/animatedTvShows.dart';
import 'package:voicelytrivia/data/movies.dart';

import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/data/tvShows.dart';
import 'package:voicelytrivia/model/constants.dart';
import 'package:animated_button/animated_button.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/screens/answerSelectionPage.dart';
import 'package:voicelytrivia/screens/viewAllPage.dart';
import 'package:voicelytrivia/data/celebritiesData.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => AnswerSelectionPage(categories
                                  .data[index][
                              random.nextInt(categories.data[index].length)])));
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
        ),
        BigCategoryText(
          title: "TV Shows",
          forViewAllPage: categories.data[1],
        ),
        ScrollableRow(
          subCategories: tvShows,
        ),
        BigCategoryText(
          title: "Animated TV Shows",
          forViewAllPage: categories.data[2],
        ),
        ScrollableRow(
          subCategories: animatedTvShows,
        ),
        BigCategoryText(
          title: "Movies",
          forViewAllPage: categories.data[3],
        ),
        ScrollableRow(
          subCategories: movies,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
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
        padding: EdgeInsets.all(10),
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
  ScrollableRow({this.subCategories});
  final List<SubCategory> subCategories;

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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AnswerSelectionPage(subCategories[index])));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  //  padding: EdgeInsets.all(10),
                  width: 180,
                  decoration: BoxDecoration(
                    //color: GradientL
                    gradient: LinearGradient(colors: [color2, color4]),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: subCategories?.length == null
                      ? null
                      : Center(
                          child: Text(
                          subCategories[index].subCategoryName,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                ),
              );
            }),
      ),
    );
  }
}
