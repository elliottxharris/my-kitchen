import 'package:flutter/material.dart';
import 'package:my_kitchen/Model/ingredient.dart';

class IngredientStatus extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientStatus({required this.ingredient, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(15),
        ),
        width: 150,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Text(
              ingredient.name,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              ingredient.daysTillExpiration <= 0 ? 'Expired' : 'Expires in',
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              '${ingredient.daysTillExpiration.abs()} ${ingredient.daysTillExpiration == 0 ? 'today' : ingredient.daysTillExpiration < 0 ? 'days ago' : 'days'}',
            ),
          ],
        ),
      ),
    );
  }
}
