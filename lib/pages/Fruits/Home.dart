import 'package:app/providers/fruits/Pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageFruits extends StatefulWidget {
  const HomepageFruits({super.key});

  @override
  State<HomepageFruits> createState() => _HomepageFruitsState();
}

class _HomepageFruitsState extends State<HomepageFruits> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerPages = Provider.of<PagesProvider>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_sharp), label: 'Carrito'),
          ],
          currentIndex: providerPages.index,
          selectedItemColor: Colors.red,
          onTap: (value) {
            providerPages.handlePage(value);
            animateToPage(value);
          },
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            onPageChanged: (value) {
              providerPages.handlePage(value);
            },
            children: providerPages.pages),
      ),
    );
  }

  void animateToPage(int index) {
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.decelerate);
  }
}
