import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTileWidget(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            color: Colors.yellow,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 10.0,
              top: 25.0,
            ),
            child: Text(
              'Coming up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildListTileWidget(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTileWidget(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed('/meal-filters');
            },
          ),
        ],
      ),
    );
  }
}
