import 'package:awesome_dialog/awesome_dialog.dart' hide AnimatedButton;
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:voicelytrivia/data/parentData.dart';
import 'package:voicelytrivia/model/currency.dart';
import 'package:voicelytrivia/model/subCategory.dart';
import 'package:voicelytrivia/model/dataProvider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:voicelytrivia/screens/answerSelectionPage.dart';

void showValidatorPopup(
    BuildContext context, SubCategory currentSubCategory, List indexes,
    {Function setStateFunction}) {
  bool canPurchase = Provider.of<DataKeeper>(context, listen: false)
      .canPurchase(currentSubCategory);

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
          height: 150,
          // color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Not Enough ",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(
                        currentSubCategory.currency == Currency.COIN
                            ? "asset/coin-01.png"
                            : "asset/diamond-04.png"),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      );
                    },
                    itemCount: 3,
                  ))
            ],
          ),
        )).show();
  } else {
    // if can purchase
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        btnOk: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: AnimatedButton(
                color: Colors.green,
                width: constraints.maxWidth - 5,
                child: Text("Yes"),
                onPressed: () async {
                  bool successPurchase;

                  if (currentSubCategory.currency == Currency.COIN) {
                    successPurchase =
                        await Provider.of<DataKeeper>(context, listen: false)
                            .addCoin(-currentSubCategory.price);
                  } else if (currentSubCategory.currency == Currency.DIAMOND) {
                    successPurchase =
                        await Provider.of<DataKeeper>(context, listen: false)
                            .addDiamond(-currentSubCategory.price);
                  }

                  if (successPurchase) {
                    if (setStateFunction != null) {
                      setStateFunction();

                      Provider.of<DataKeeper>(context, listen: false)
                          .updateStartTime(DateTime.now(),
                              currentSubCategory.subCategoryName);


                    }

                    Navigator.pop(context);

                    await Provider.of<DataKeeper>(context, listen: false)
                        .updatePurchaseDatabase(
                            currentSubCategory.subCategoryName);
                    Provider.of<DataKeeper>(context, listen: false)
                        .updatePlayedThisManyTimes(1, currentSubCategory.subCategoryName);


                    Random random = Random();

                    int index = random.nextInt(categories.data.length);

                    // todo update database
                    // todo increment remainder play using set state



                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnswerSelectionPage(
                                categories.data[index][random
                                    .nextInt(categories.data[index].length)])));
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
          // height: 140,
          // color: Colors.purple,
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "Are you sure you want to buy \"${currentSubCategory.subCategoryName}\"?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${currentSubCategory.price}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(
                        currentSubCategory.currency == Currency.COIN
                            ? "asset/coin-01.png"
                            : "asset/diamond-04.png"),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        )).show();
  }
}
