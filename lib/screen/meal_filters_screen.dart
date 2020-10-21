import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class MealFilters extends StatefulWidget {
  final Map<String, bool> mealFilters;
  final Function filterItems;

  MealFilters(
    this.mealFilters,
    this.filterItems,
  );
  @override
  _MealFiltersState createState() => _MealFiltersState();
}

class _MealFiltersState extends State<MealFilters> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    setState(() {
      _glutenFree = widget.mealFilters['gluten'];
      _lactoseFree = widget.mealFilters['lactose'];
      _vegetarian = widget.mealFilters['vegetarian'];
      _vegan = widget.mealFilters['vegan'];
    });
    super.initState();
  }

  List<Widget> _buildSwitchTileWidget(
    String title,
    String subtitle,
    bool boolValue,
    Function changeHandler,
  ) {
    return [
      SwitchListTile.adaptive(
        activeColor: Colors.yellow,
        value: boolValue,
        onChanged: changeHandler,
        title: Text(title),
        subtitle: Text(subtitle),
      ),
      Divider(
        height: 0.0,
        indent: 10.0,
        endIndent: 10.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedMeal = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.filterItems(selectedMeal);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 10.0,
            ),
            child: Text(
              'Adjust your meal section',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ..._buildSwitchTileWidget(
            'Gluten-free',
            'Only include gluten-free meals',
            _glutenFree,
            (bool value) {
              setState(() {
                _glutenFree = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Lactose-free',
            'Only include lactose-free meals',
            _lactoseFree,
            (bool value) {
              setState(() {
                _lactoseFree = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Vegetarian',
            'Only include vegitarian meals',
            _vegetarian,
            (bool value) {
              setState(() {
                _vegetarian = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Vegan',
            'Only include vegan meals',
            _vegan,
            (bool value) {
              setState(() {
                _vegan = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
