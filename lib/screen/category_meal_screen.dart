import 'package:flutter/material.dart';

import '../widgets/categoy_meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: displayedMeals
              .map((meal) => CategoryMealItem(
                    id: meal.id,
                    categories: meal.categories,
                    imageUrl: meal.imageUrl,
                    title: meal.title,
                    duration: meal.duration,
                    affordability: meal.affordability,
                    complexity: meal.complexity,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
