import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  String _mYText = '';

  String get myText => _mYText;

  set setMytext(String text) {
    _mYText = text;

    notifyListeners();
  }
}
