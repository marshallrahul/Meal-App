import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    this.title,
    this.color = Colors.orange,
  });
}
