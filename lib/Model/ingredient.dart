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
}
