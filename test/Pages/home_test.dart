import 'package:flutter_test/flutter_test.dart';
import 'package:my_kitchen/Model/ingredient.dart';

void main() {
  group('home page tests', () {
    late Ingredient ingredient;
    late DateTime now;

    setUp(() {
      now = DateTime.now();
      ingredient = Ingredient(
        name: 'Test name',
        description: 'Test description',
        boughtDate: now,
        expirationDate: now.add(const Duration(days: 3)),
      );
    });

    test('basic properties', () {
      expect(ingredient.name, 'Test name');
      expect(ingredient.description, 'Test description');
      expect(ingredient.boughtDate, now);
      expect(ingredient.expirationDate, now.add(const Duration(days: 3)));
    });

    test('computed props', () {
      expect(ingredient.daysTillExpiration, 3);
    });
  });
}
