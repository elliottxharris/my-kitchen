import 'package:flutter/material.dart';
import 'package:my_kitchen/Model/ingredient.dart';
import 'package:my_kitchen/Widgets/ingredient_status.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Ingredient> _ingredients = [
    Ingredient(
      name: 'Ground Beef',
      description: 'Cow meat',
      boughtDate: DateTime.now(),
      expirationDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Ingredient(
      name: 'Chicken Breast',
      description: 'Lean meat',
      boughtDate: DateTime.now(),
      expirationDate: DateTime.now().add(const Duration(days: 4)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _ingredients.length,
              itemBuilder: (context, index) =>
                  IngredientStatus(ingredient: _ingredients[index]),
            ),
          ),
        ),
      ),
    );
  }
}
