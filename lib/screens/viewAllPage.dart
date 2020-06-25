import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/model/constants.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/dataProvider.dart';
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
          SubCategory currentSubCategory = subCategoryList[index];
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
                        "${currentSubCategory.subCategoryName}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedButton(
                      height: 50,
                      width: 90,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${currentSubCategory.price == null ? 500 : currentSubCategory.price}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Image(
                            height: 25,
                            width: 25,
                            image: AssetImage(
                                currentSubCategory.currency == Currency.COIN
                                    ? "asset/coin-01.png"
                                    : "asset/diamond-04.png"),
                          ),
                        ],
                      ),
                      color: Provider.of<DataKeeper>(context).getColor(context: context, currentSubCategory: currentSubCategory),
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
