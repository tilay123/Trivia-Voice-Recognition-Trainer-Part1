import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';

class ShopBottomNavigation extends StatelessWidget {
  final List<String> coinNames = [
    "oneCoin-02.png",
    "twoCoin-05.png",
    "threeCoin-07.png",
    "coinPack-03.png",
    "coinPile-06.png",
    "diamond-04.png",
    "twoDiamond-08.png",
    "threeDiamond-09.png",
    "fourDiamond-10.png"
  ];
  final List<double> coinPrices = [
    0.99,
    4.99,
    9.99,
    24.99,
    99.99,
    2.99,
    4.99,
    24.99,
    99.99
  ];
  final List<int> coinAmount = [
    1000,
    5500,
    11000,
    29000,
    150000,
    3,
    5,
    32,
    140
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CoinHolder(),
          DiamondHolder(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffD4B483), borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      height: 80,
                      width: 80,
                      image: AssetImage("asset/${coinNames[index]}"),
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Text(
                        "${coinAmount[index]} Coins",
                        style: TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedButton(
                      height: 50,
                      width: 80,
                      child: Text(
                        "\$${coinPrices[index]}",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: coinNames.length,
      ),
    );
  }
}
