import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_kitchen/Model/ingredient.dart';
import 'package:my_kitchen/Service/firestore_service.dart';
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
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 130,
              child: StreamBuilder(
                stream: FireStoreService().getIngredients(),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    final List ingredients = snap.data!.docs;
                    return ListView.builder(
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) => IngredientStatus(
                              ingredient:
                                  Ingredient.fromFirebase(ingredients[0]),
                            ));
                  }
                },
              )),
        ),
      ),
    );
  }
}
