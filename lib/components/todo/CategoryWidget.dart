import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        categoryName,
        style: const TextStyle(
          fontFamily: 'poppinsmedium',
          fontSize: 15,
        ),
      ),
    ));
  }
}
