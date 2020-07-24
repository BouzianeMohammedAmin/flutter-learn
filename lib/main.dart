import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/shopingcard.dart';
import 'package:learnflutter/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShoppingCard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
