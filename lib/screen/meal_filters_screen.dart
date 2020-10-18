import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class MealFilters extends StatefulWidget {
  @override
  _MealFiltersState createState() => _MealFiltersState();
}

class _MealFiltersState extends State<MealFilters> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegitarianFree = false;
  bool _veganFree = false;

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
            (value) {
              setState(() {
                _glutenFree = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Lactose-free',
            'Only include lactose-free meals',
            _lactoseFree,
            (value) {
              setState(() {
                _lactoseFree = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Vegitarian-free',
            'Only include vegitarian-free meals',
            _vegitarianFree,
            (value) {
              setState(() {
                _vegitarianFree = value;
              });
            },
          ),
          ..._buildSwitchTileWidget(
            'Vegan-free',
            'Only include vegan-free meals',
            _veganFree,
            (value) {
              setState(() {
                _veganFree = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
