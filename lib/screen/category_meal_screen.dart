import 'package:flutter/material.dart';

import '../widgets/categoy_meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final displayedMeals = DUMMY_MEALS
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
