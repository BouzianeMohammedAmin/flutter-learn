import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/shopingcard.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCard card = ShoppingCard.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${card.products.length} Selected',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
