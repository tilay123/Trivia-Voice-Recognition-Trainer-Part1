import 'package:flutter/material.dart';
import 'screens/shop.dart';
import 'model/dataProvider.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => DataKeeper(), child: TriviaVoice()));
}

class TriviaVoice extends StatefulWidget {
  @override
  _TriviaVoiceState createState() => _TriviaVoiceState();
}

class _TriviaVoiceState extends State<TriviaVoice> {
  // int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> bodies = [
      HomeBottomNavigation(),
      ShopBottomNavigation(),
    ];

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff4281A4),
        //  scaffoldBackgroundColor: Color(0xffE4DFDA),
        scaffoldBackgroundColor: Color(0xffe1d3b3),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: bodies.elementAt(
            Provider.of<DataKeeper>(context).getHomePageCurrentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex:
              Provider.of<DataKeeper>(context).getHomePageCurrentIndex,
          onTap: (index) {
            Provider.of<DataKeeper>(context, listen: false)
                .setCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shop,
                  color: Colors.white,
                ),
                title: Text(
                  "Shop",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            // Provider.of<DataKeeper>(context, listen: false).addCoin(50);
            Provider.of<DataKeeper>(context, listen: false).addDiamond(1);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            //child: Center(child: Text("+50 Coin")),
            child: Center(child: Text("+1 Diamond")),
          ),
        ),
      ),
    );
  }
}
