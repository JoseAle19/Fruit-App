import 'package:app/models/todo/Categorymodel.dart';
import 'package:app/pages/Todo/Calendar.dart';
import 'package:app/pages/Todo/Profile.dart';
import 'package:app/pages/Todo/task.dart';
import 'package:app/providers/fruits/Pages.dart';
import 'package:app/providers/todo/categoryProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({super.key});

  @override
  State<HomeTodo> createState() => _HomeTodoState();
}

class _HomeTodoState extends State<HomeTodo> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerpages = Provider.of<PagesProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigation(
            provider: providerpages,
            controller: _pageController,
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Colors.white,
            onPressed: () {
              CategoryModel categoryModel = CategoryModel(
                  name: 'Category ${categoryProvider.categories.length}');
              categoryProvider.addCategory(categoryModel);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          body: SizedBox.expand(
            child: PageView(
              onPageChanged: (value) => {providerpages.handlePage(value)},
              controller: _pageController,
              children: [Calendar(), Task(), Profile()],
            ),
          )),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.provider,
    required this.controller,
  });
  final PagesProvider provider;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) =>
                {provider.handlePage(value), animateToPage(value)},
            currentIndex: provider.index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'Calendar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined), label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }

  void animateToPage(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }
}
