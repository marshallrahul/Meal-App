import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'meal_favourite_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedBarItem = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedBarItem = index;
    });
  }

  final List<Map<String, Object>> currentPage = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': MealFavourite(),
      'title': 'Your Favourite',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage[_selectedBarItem]['title']),
      ),
      drawer: MainDrawer(),
      body: currentPage[_selectedBarItem]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourite'),
          ),
        ],
        onTap: _selectPage,
        elevation: 15.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBarItem,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
