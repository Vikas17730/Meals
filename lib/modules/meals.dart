import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String? id;
  final List<String>? categories;
  final String? title;
  final List<String>? ingredients;
  final String? imageUrl;
  final List<String>? steps;
  final Complexity? complexity;
  final int? duration;
  final Affordability? affordability;
  final bool? isLactoseFree;
  final bool? isGlutenFree;
  final bool? isVegan;
  final bool? isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.ingredients,
    @required this.imageUrl,
    @required this.steps,
    @required this.complexity,
    @required this.duration,
    @required this.affordability,
    @required this.isLactoseFree,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
