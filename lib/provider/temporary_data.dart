import 'package:flutter/material.dart';

class TemporaryData with ChangeNotifier {
  int _initialIndex = 0;
  int _initialScore = 0;

  int get initialIndex {
    return _initialIndex;
  }

  int get score {
    return _initialScore;
  }

  void changeIndex() {
    _initialIndex = _initialIndex + 1;
    notifyListeners();
  }

  void updateScore() {
    _initialScore = _initialScore + 1;
    notifyListeners();
  }

  void resetQuiz() {
    _initialIndex = 0;
    _initialScore = 0;
    notifyListeners();
  }
}
