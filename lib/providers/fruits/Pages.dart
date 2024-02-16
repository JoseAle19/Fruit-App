import 'package:app/pages/Fruits/Cart.dart';
import 'package:app/pages/Fruits/FavoriteFood.dart';
import 'package:app/pages/Fruits/MenuPageSushi.dart';
import 'package:flutter/material.dart';

class PagesProvider with ChangeNotifier {
  final List<Widget> _wigetsOptions = <Widget>[
    const FavoriteFood(),
    MenuPage(),
    const CartItems(),
  ];
  int _index = 1;
  List<Widget> get pages => _wigetsOptions;
  int get index => _index;

  void handlePage(int newindex) {
    _index = newindex;
    notifyListeners();
  }
}
