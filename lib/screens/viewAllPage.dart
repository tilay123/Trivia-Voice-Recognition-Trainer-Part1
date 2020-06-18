import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:voicelytrivia/model/constants.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';

class ViewAllPage extends StatelessWidget {
  ViewAllPage(this.subCategoryList);
  final List<SubCategory> subCategoryList;

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
                        "${subCategoryList[index].subCategoryName}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedButton(
                      height: 50,
                      width: 80,
                      child: Text("Play"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: subCategoryList.length,
      ),
    );
  }
}
