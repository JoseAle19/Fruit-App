import 'package:app/models/Food.dart';
import 'package:app/providers/fruits/Favorite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardMenuItem extends StatelessWidget {
  const CardMenuItem({super.key, required this.food, required this.onTap});
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final providerFavorite = Provider.of<FoodFavorite>(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      providerFavorite.handleFavorite(food);
                    },
                    icon: Icon(
                      !providerFavorite.listFavorite.contains(food)
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color: Colors.red,
                      size: 35,
                    )),

                // Image
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Hero(
                    tag: food.name,
                    child: Image.asset(
                      food.imagePath,
                      width: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Name
                Text(
                  food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                // price and ratinf
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${food.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_sharp,
                            color: Color.fromARGB(255, 214, 194, 13),
                          ),
                          Text('${food.rating}'),
                        ],
                      ),
                    ])
              ],
            ),
          )),
    );
  }
}
