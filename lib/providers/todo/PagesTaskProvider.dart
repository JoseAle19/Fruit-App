import 'package:app/providers/todo/categoryProvider.dart';
import 'package:flutter/material.dart';

class PagesTaskProvider with ChangeNotifier {
  final CategoryProvider _categoryProvider;

  PagesTaskProvider(this._categoryProvider);

  String _selected = 'All Task';
  String get selected => _selected;
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void setSelected(String value) {
    int index = _categoryProvider.categories
        .indexWhere((category) => category.name == value);
    handlePage(index >= 0 ? index : 0);

    _selected = value;
    notifyListeners();
  }

  void resetSelected() {
    _selected = 'All Task';
  }

  void handlePage(int value) {
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInSine);
    notifyListeners();
  }
}
