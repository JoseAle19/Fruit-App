import 'package:app/components/Fruit/FooditemProductCart.dart';
import 'package:app/models/Food.dart';
import 'package:app/models/FoodItemCart.dart';
import 'package:flutter/material.dart';

class Shop with ChangeNotifier {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> get animatedListKey => _animatedListKey;
  final List<FoodItem> _cartUser = [];
  List<FoodItem> get cart => _cartUser;
  final List _fooMenuList = [
    Food(
      name: 'Piña',
      description:
          'Disfruta de la frescura y dulzura de nuestra deliciosa piña, cultivada localmente. Esta fruta tropical es conocida por su sabor refrescante y jugoso, perfecta para satisfacer tus antojos de manera saludable.',
      price: '10.70',
      imagePath: 'assets/images/img1.png',
      rating: '7.9',
      color: Colors.orange, // Color principal para la piña
      secondaryColor: Colors.orange.shade900,
    ),
    Food(
      name: 'Sandía',
      description:
          'Sumérgete en la frescura de nuestra jugosa sandía, importada para ofrecerte la máxima calidad. Con su contenido elevado de agua, es la elección perfecta para mantenerte hidratado en los días calurosos de verano.',
      price: '53.70',
      imagePath: 'assets/images/img2.png',
      rating: '5.9',
      color: Colors.red, // Color principal para la sandía
      secondaryColor: Colors.red.shade900,
    ),
    Food(
      name: 'Manzana',
      description:
          'Descubre la delicia crujiente de nuestras manzanas locales. Este snack clásico y saludable es perfecto para cualquier momento del día. Cultivadas con cuidado, nuestras manzanas son una fuente natural de energía.',
      price: '4.70',
      imagePath: 'assets/images/img3.png',
      rating: '10.0',
      color: Colors.green, // Color principal para la manzana
      secondaryColor: Colors.green.shade900,
    ),
    Food(
      name: 'Naranja',
      description:
          'Experimenta la explosión de sabor cítrico con nuestras naranjas frescas. Ricas en vitamina C, estas naranjas cultivadas localmente son ideales para mantener tu sistema inmunológico fuerte y tu paladar feliz.',
      price: '2.70',
      imagePath: 'assets/images/img4.png',
      rating: '7.9',
      color: Colors.deepOrange, // Color principal para la naranja
      secondaryColor: Colors.deepOrange.shade900,
    ),
    Food(
      name: 'Mango',
      description:
          'Viaja a los trópicos con nuestro mango exquisito, importado para brindarte autenticidad y sabor inigualables. Este mango jugoso y dulce te transportará con cada bocado, creando una experiencia tropical en cada momento.',
      price: '32.70',
      imagePath: 'assets/images/img5.png',
      rating: '9.9',
      color: Colors.amber.shade900, // Color principal para el mango
      secondaryColor: Colors.amber.shade300,
    ),
  ];
  List get fooMenuList => _fooMenuList;

  void addToCart(Food food, int items) {
    if (_cartUser.any((fd) => fd.food == food)) {
      final index = _cartUser.indexWhere((fd) => fd.food == food);
      _cartUser[index].quantity += items;
      notifyListeners();
    } else {
      _cartUser.add(FoodItem(food: food, quantity: items));
      notifyListeners();
    }
  }

  void removeFoodTocart(FoodItem food) {
    final index = _cartUser.indexOf(food);
    final indexFood = _cartUser[index];
    _cartUser.remove(food);

    animatedListKey.currentState!.removeItem(
        index,
        (context, animation) => FoodItemProductCart(
            animation: animation,
            food: indexFood.food,
            foodQuantity: indexFood.quantity,
            index: index,
            total: indexFood.quantity.toDouble() *
                double.parse(indexFood.food.price)),
        duration: const Duration(milliseconds: 500));
    notifyListeners();
  }
}
