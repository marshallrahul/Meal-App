import 'package:flutter/material.dart';

import './screen/category_meal_screen.dart';
import './screen/meal_details_screen.dart';
import './screen/tab_bar_screen.dart';
import './screen/meal_filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filteredItem(Map<String, bool> value) {
    setState(() {
      _filters = value;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] == true) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] == true) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] == true) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] == true) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_availableMeals);
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
        '/category-meal': (ctx) => CategoryMealScreen(_availableMeals),
        '/meal-details': (ctx) => MealDetailsScreen(),
        '/meal-filters': (ctx) => MealFilters(_filters, _filteredItem),
      },
    );
  }
}
