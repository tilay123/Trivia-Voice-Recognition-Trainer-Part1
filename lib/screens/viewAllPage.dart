import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/helpers/popUps.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/dataProvider.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/helpers/helperCurrencyUI.dart';

class ViewAllPage extends StatefulWidget {
  ViewAllPage(this.subCategoryList, {this.parentIndex});
  final List<SubCategory> subCategoryList;
  final parentIndex;

  @override
  _ViewAllPageState createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
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
          SubCategory currentSubCategory = widget.subCategoryList[index];
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                      color: Provider.of<DataKeeper>(context).getColor(
                          context: context,
                          currentSubCategory: currentSubCategory),
                      onPressed: () {
                        showValidatorPopup(context, currentSubCategory,
                            [widget.parentIndex, index], setStateFunction: () {
                          setState(() {
                            //  data.purchased = true; // can't change the copy of the original data.
                            categories.data[widget.parentIndex][index]
                                .purchased = true;
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget.subCategoryList.length,
      ),
    );
  }
}
