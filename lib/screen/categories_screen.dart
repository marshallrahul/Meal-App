import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (item) => CategoryItem(
                item.id,
                item.color,
                item.title,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
