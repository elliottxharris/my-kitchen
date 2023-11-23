import 'package:flutter/material.dart';
import 'package:my_kitchen/Pages/home.dart';
import 'package:my_kitchen/Pages/ingredients.dart';
import 'package:my_kitchen/Pages/recipes.dart';
import 'package:my_kitchen/Pages/settings.dart';
import 'package:my_kitchen/Pages/tab_bar_pages.dart';
import 'package:my_kitchen/Themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Widget> _pages = [
    const Home(),
    const Ingredients(),
    const Recipes(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return TabBarPages(pages: _pages);
  }
}
