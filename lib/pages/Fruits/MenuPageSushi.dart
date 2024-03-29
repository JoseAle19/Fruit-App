import 'package:app/components/CardProductMenu.dart';
import 'package:app/components/MyButton.dart';
import 'package:app/models/Food.dart';
import 'package:app/pages/Details_food_details.dart';
import 'package:app/providers/Shop.dart';
import 'package:app/themes/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<Shop>(context);
    void navigateFoodDetails(Food foodIndex) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsFood(
                    foodIndex: foodIndex,
                  )));
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_outlined)),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: const Text('Frutas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '35% de descuento',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const MyButton(text: 'Ver más', onTap: null)
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/img4.png',
                      height: 150,
                      width: 150,
                    ),
                  )
                ],
              ),
            ),

            // Title del contenido
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Text(
                'Menu de frutas',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            // Food menu
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: cartprovider.fooMenuList
                    .asMap()
                    .entries
                    .map(
                      (food) => CardMenuItem(
                          food: food.value,
                          onTap: () => navigateFoodDetails(food.value)),
                    )
                    .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/img3.png',
                        height: 100,
                      ),
                      Column(
                        children: [
                          Text(
                            'Pineapple',
                            style: GoogleFonts.dmSerifDisplay(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Text(
                            '\$ 10.0',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
