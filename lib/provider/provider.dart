import 'package:flutter/material.dart';

class CounterApp extends ChangeNotifier {
  int count = 5;

  int get getValue => count;

  void increement() {
    ++count;
    notifyListeners();
  }

  void decreement() {
    --count;
    notifyListeners();
  }
}
