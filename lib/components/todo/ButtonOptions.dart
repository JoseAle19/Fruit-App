import 'package:app/components/todo/OptionButton.dart';
import 'package:app/providers/todo/PagesTaskProvider.dart';
import 'package:app/providers/todo/categoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ButtonOptions extends StatelessWidget {
  ButtonOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final pagesTaskProvider = Provider.of<PagesTaskProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return OptionButton(
            onTap: () => pagesTaskProvider
                .setSelected(categoryProvider.categories[index].name),
            value: categoryProvider.categories[index].name,
            text: categoryProvider.categories[index].name,
          );
        },
      ),
    );
  }
}
