import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  String name, description;
  DateTime boughtDate, expirationDate;

  int get daysTillExpiration =>
     expirationDate.difference(boughtDate).inDays;

  Ingredient({
    required this.name,
    required this.description,
    required this.boughtDate,
    required this.expirationDate,
  });

  factory Ingredient.fromFirebase(QueryDocumentSnapshot<Object?> ingredient) {
    Map<String, dynamic> ingredientMap = ingredient.data() as Map<String, dynamic>;

    return Ingredient(name: ingredientMap['name'],
    description: ingredientMap['description'],
    boughtDate: (ingredientMap['boughtDate'] as Timestamp).toDate(),
    expirationDate: (ingredientMap['expirationDate'] as Timestamp).toDate());
  }
}
