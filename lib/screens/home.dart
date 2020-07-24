import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/shopingcard.dart';
import 'package:learnflutter/models/product.dart';
import 'package:learnflutter/screens/card_details.dart';

class Home extends StatelessWidget {
  List<Product> prodects = List.generate(
      100,
      (index) => Product(
            isCheck: false,
            name: 'Product $index',
            price: Random().nextInt(5000),
          ));
  @override
  Widget build(BuildContext context) {
    ShoppingCard card = ShoppingCard.of(context);
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart '),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Badge(
                elevation: 10,
                badgeContent: Text(
                  '${card.products.length}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CardDetails();
                      }));
                    }),
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: prodects.length,
            itemBuilder: (BuildContext context, indexd) {
              return ListTile(
                subtitle: Text('${prodects[indexd].price} DA'),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(prodects[indexd].name),
                    Checkbox(
                        value: prodects[indexd].isCheck,
                        onChanged: (value) {
                          setState(() {
                            prodects[indexd].isCheck =
                                !prodects[indexd].isCheck;
                            if (prodects[indexd].isCheck) {
                              card.products.add(prodects[indexd]);
                            } else {
                              card.products.remove(prodects[indexd]);
                            }
                          });
                        }),
                  ],
                ),
              );
            }),
      );
    });
  }
}
