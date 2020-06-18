import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class DataKeeper extends ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex {
    return _currentIndex;
  }


  void setCurrentIndex(int x) {
    _currentIndex = x;
    notifyListeners();
  }

  int _centerText = 15;
  int get getCenterText {
    return _centerText;
  }

  set setCenterText(int num) {
    _centerText = num;
    notifyListeners();
  }




}
