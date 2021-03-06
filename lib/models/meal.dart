enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Affordability affordability;
  final Complexity complexity;
  final double duration;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    this.id,
    this.title,
    this.categories,
    this.affordability,
    this.complexity,
    this.duration,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });
}
