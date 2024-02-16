import 'package:app/components/Fruit/FooditemProductCart.dart';
import 'package:app/components/MyButton.dart';
import 'package:app/models/Food.dart';
import 'package:app/providers/Shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Shop>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Carrito de compras'),
      ),
      body: Center(
        child: cartProvider.cart.isEmpty
            ? const Center(
                child: Text('Sin productos agregados :('),
              )
            : Column(
                children: [
                  const Expanded(child: AnimatedListBuilder()),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const MyButton(text: 'Pasar a pagar', onTap: null),
                  )
                ],
              ),
      ),
    );
  }
}

class AnimatedListBuilder extends StatelessWidget {
  const AnimatedListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Shop>(context);
    return AnimatedList(
        key: cartProvider.animatedListKey,
        initialItemCount: cartProvider.cart.length,
        itemBuilder: (context, index, animation) {
          Food food = cartProvider.cart[index].food;
          int foodQuantity = cartProvider.cart[index].quantity;
          double total = foodQuantity * double.parse(food.price);
          return FoodItemProductCart(
              food: food,
              foodQuantity: foodQuantity,
              total: total,
              index: index,
              animation: animation);
        });
  }
}
