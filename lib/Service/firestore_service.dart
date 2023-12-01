import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_kitchen/Model/ingredient.dart';

class FireStoreService {
  static final FireStoreService current = FireStoreService();

  final CollectionReference _ingredients =
      FirebaseFirestore.instance.collection('ingredients');

  Future<DocumentReference<Object?>> addIngredient(
      Ingredient ingredient) async {
    return _ingredients.add({
      'name': ingredient.name,
      'description': ingredient.description,
      'boughtDate': ingredient.boughtDate,
      'expirationDate': ingredient.expirationDate,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getIngredients() =>
      _ingredients.orderBy('timestamp', descending: true).snapshots();
}
