import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:voicelytrivia/model/constants.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';

class ShopBottomNavigation extends StatelessWidget {
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
                  color: color4, borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "The Family ",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedButton(
                      height: 50,
                      width: 80,
                      child: Text("\$${.99 + index}"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
