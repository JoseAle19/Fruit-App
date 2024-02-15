import 'package:app/models/Food.dart';
import 'package:app/providers/Shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodItemProductCart extends StatelessWidget {
  final Animation<double> animation;
  final Food food;
  final double total;
  final int foodQuantity;
  final int index;
  const FoodItemProductCart(
      {super.key,
      required this.animation,
      required this.food,
      required this.foodQuantity,
      required this.index,
      required this.total});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Shop>(context);
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[200],
          ),
          child: ListTile(
            leading: Image.asset(
              food.imagePath,
            ),
            // subtitle: const ButtonAddToDel(color: Colors.red),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      food.name,
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'X${foodQuantity.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text("\$${(total.toStringAsFixed(2))} USD"),
              ],
            ),
            trailing: IconButton(
              onPressed: () => cartProvider.removeFoodTocart(
                cartProvider.cart[index],
              ),
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
