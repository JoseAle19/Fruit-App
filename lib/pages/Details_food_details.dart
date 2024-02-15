import 'package:app/components/MyButton.dart';
import 'package:app/models/Food.dart';
import 'package:app/providers/Shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsFood extends StatefulWidget {
  const DetailsFood({super.key, required this.foodIndex});
  final Food foodIndex;
  @override
  State<DetailsFood> createState() => _DetailsFoodState();
}

class _DetailsFoodState extends State<DetailsFood> {
  int countProduct = 0;

  void incrementProduct() {
    setState(() {
      countProduct++;
    });
  }

  void decrementProduct() {
    setState(() {
      if (countProduct >= 1) {
        countProduct--;
      }
      return;
    });
  }

  void addToCart(Food food, int quantity, context) {
    final cartProvider = Provider.of<Shop>(context, listen: false);
    if (countProduct < 1) {
      return;
    } else {
      cartProvider.addToCart(food, quantity);
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Producto agregado'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.foodIndex.name,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: widget.foodIndex.secondaryColor,
                    ),
                    padding: const EdgeInsets.all(20),
                    height: 150,
                    width: 150,
                    child: Image.asset(widget.foodIndex.imagePath),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.foodIndex.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                          size: 30,
                        ),
                        Text(
                          widget.foodIndex.rating,
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[500]),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Desccripción',
                  style: GoogleFonts.dmSerifDisplay(fontSize: 25),
                ),
                Text(
                  widget.foodIndex.description,
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 15, height: 2),
                )
              ],
            ),
          ),
          // price and button add cart
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: widget.foodIndex.color,
            ),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(children: [
              // price and quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${widget.foodIndex.price}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  // Quantity
                  Row(
                    children: [
                      // Min
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(224, 224, 224, 0.187),
                            shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => incrementProduct(),
                            icon: const Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            )),
                      ),
                      // Count
                      Text(
                        countProduct.toString(),
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      // Max
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(224, 224, 224, 0.187),
                            shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => decrementProduct(),
                            icon: const Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyButton(
                text: 'Agregar al carrito',
                onTap: () => addToCart(widget.foodIndex, countProduct, context),
                color: widget.foodIndex.secondaryColor,
              )
              // Button add cart
            ]),
          )
        ],
      ),
    );
  }
}
