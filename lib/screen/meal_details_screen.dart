import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  Widget buildContainer(Widget child) {
    return Container(
      height: 150.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(
          color: Colors.red[300],
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  Widget buildTextContainer(double num, String text) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(num),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealItemTitle = routeArgs['title'];
    final mealItemImage = routeArgs['image'];
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealItemTitle),
      ),
      body: Container(
        color: Colors.red[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                mealItemImage,
                fit: BoxFit.cover,
              ),
              Container(
                child: Column(
                  children: [
                    buildTextContainer(15.0, 'Ingredients'),
                    buildContainer(ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          color: Colors.purpleAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              selectedMeal.ingredients[index],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: selectedMeal.ingredients.length,
                    )),
                    buildTextContainer(15.0, 'Steps'),
                    buildContainer(ListView.builder(
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                            radius: 18.0,
                          ),
                          title: Text(
                            '${selectedMeal.steps[index]}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        );
                      },
                      itemCount: selectedMeal.steps.length,
                    )),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
