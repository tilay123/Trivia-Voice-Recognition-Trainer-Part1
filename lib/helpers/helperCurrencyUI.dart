import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_button/animated_button.dart';
import 'package:voicelytrivia/model/dataProvider.dart';

class CoinHolder extends StatelessWidget {
  const CoinHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        //    print(constraints.maxWidth);
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 2),
          height: 80,
          // width: 120,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),

          // Gem/ Diamond
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Positioned(
                left: 15,
                top: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 11),
                  width: constraints.maxWidth - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  // padding: EdgeInsets.all(4),
                  // width: 120,
                  height: 40,
                  child: Text(
                    "${Provider.of<DataKeeper>(context).getCoin}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Image(
                height: 80,
                width: 40,
                image: AssetImage("asset/coin-01.png"),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                right: 23,
                child: AnimatedButton(
                  onPressed: () {
                    Provider.of<DataKeeper>(context, listen: false)
                        .setCurrentIndex(1);
                  },
                  height: 30,
                  width: 30,
                  child: Text("+"),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class DiamondHolder extends StatelessWidget {
  const DiamondHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        // print(constraints.maxWidth);
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 2),
          height: 80,
          // width: 120,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),

          // Gem/ Diamond
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Positioned(
                left: 15,
                top: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 11),
                  width: constraints.maxWidth - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  // padding: EdgeInsets.all(4),
                  // width: 120,
                  height: 40,
                  child: Text(
                    "${Provider.of<DataKeeper>(context,listen: false).getDiamond}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Image(
                height: 80,
                width: 40,
                image: AssetImage("asset/diamond-04.png"),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                right: 23,
                child: AnimatedButton(
                  onPressed: () {
                    Provider.of<DataKeeper>(context, listen: false)
                        .setCurrentIndex(1);
                  },
                  height: 30,
                  width: 30,
                  child: Text("+"),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
