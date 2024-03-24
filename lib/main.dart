import 'package:app/pages/Home.dart';
import 'package:app/providers/ConuterProvider.dart';
import 'package:app/providers/Shop.dart';
import 'package:app/providers/ThemeChanger.dart';
import 'package:app/providers/fruits/Favorite.dart';
import 'package:app/providers/fruits/Pages.dart';
import 'package:app/providers/provider.dart';
import 'package:app/providers/todo/PagesTaskProvider.dart';
import 'package:app/providers/todo/categoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => MyProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => FoodFavorite()),
        ChangeNotifierProvider(create: (_) => PagesProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) {
          return PagesTaskProvider(
              Provider.of<CategoryProvider>(context, listen: false));
        }),
        ChangeNotifierProvider(
          create: (_) => Shop(),
        ),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider example',
        themeMode: themeChanger.getTheme,
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.orange),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Ejemplos con provider'),
              ),
              body: const Homepage()),
        ));
  }
}
