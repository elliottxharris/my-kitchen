import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Ingredients'),
      ),
    );
  }
}
