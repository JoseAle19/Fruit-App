import 'package:app/models/Food.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodFavorite with ChangeNotifier {
  List<Food> _listFavorite = [];

  List<Food> get listFavorite => _listFavorite;
//  Leer o cargar los frutas/comida al iniciar
  void loadFavorites() async {
    final _prefs = await SharedPreferences.getInstance();
    final List<String>? encodeList = _prefs.getStringList('favoriteFoods');
    if (encodeList != null) {
      _listFavorite = encodeList.map((e) => Food.decode(e)).toList();
    }
    notifyListeners();
  }

// Guardar una nueva fruta
  void saveFavorite() async {
    final _prefs = await SharedPreferences.getInstance();
    final List<String> encodedList =
        _listFavorite.map((e) => e.encode()).toList();
    _prefs.setStringList('favoriteFoods', encodedList);
    notifyListeners();
  }

  void handleFavorite(Food food) {
    // Vvalidar si esta o no la fruta en el arreglo
    if (_listFavorite.contains(food)) {
      // Si esta lo removemos
      _listFavorite.remove(food);
    } else {
      // Si no esta se agrega al arreglo
      _listFavorite.add(food);
    }
    // Guardar en shared preferences (Local)
    saveFavorite();
    notifyListeners();
  }
}
