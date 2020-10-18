import 'package:flutter/material.dart';

import './screen/category_meal_screen.dart';
import './screen/meal_details_screen.dart';
import './screen/tab_bar_screen.dart';
import './screen/meal_filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.green,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 15.0,
                fontWeight: FontWeight.w100,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        '/category-meal': (ctx) => CategoryMealScreen(),
        '/meal-details': (ctx) => MealDetailsScreen(),
        '/meal-filters': (ctx) => MealFilters(),
      },
    );
  }
}
