import 'package:app/models/todo/Categorymodel.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final List<CategoryModel> _categories = [CategoryModel(name: "All Task")];

  List<CategoryModel> get categories => _categories;

  void addCategory(CategoryModel category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(CategoryModel category) {
    _categories.remove(category);
    notifyListeners();
  }
}
