import 'package:flutter/material.dart';
import 'package:learnflutter/models/product.dart';
import 'package:collection/collection.dart';

class ShoppingCard extends InheritedWidget {
  List<Product> products = [];
  Widget child;
  ShoppingCard({this.child});
  @override
  bool updateShouldNotify(ShoppingCard oldWidget) {
    return !IterableEquality().equals(products, oldWidget.products);
  }

  static ShoppingCard of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
