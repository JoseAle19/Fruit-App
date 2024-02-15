import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get counter => _count;
  void resetCounter() {
    _count = 0;
    notifyListeners();
  }

  void incrementCounter() {
    _count++;
    notifyListeners();
  }
}
