import 'dart:convert';

import 'package:flutter/material.dart';

class Food {
  String name;
  String description;
  String price;
  String imagePath;
  String rating;
  Color color;
  Color secondaryColor;
  int? quantity;

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.color,
    required this.secondaryColor,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'rating': rating,
      'color': color.value,
      'secondaryColor': secondaryColor.value, //Guardar el color como int
      'quantity': quantity,
    };
  }

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imagePath: json['imagePath'],
        rating: json['rating'],
        color: Color(json['color']),
        secondaryColor: Color(json['secondaryColor']));
  }

  String encode() {
    return json.encode(toJson());
  }

  static Food decode(String jsonString) {
    final Map<String, dynamic> parsedJson = json.decode(jsonString);
    return Food.fromJson(parsedJson);
  }
}
