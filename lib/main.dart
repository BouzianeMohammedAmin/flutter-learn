import 'package:flutter/material.dart';
import 'package:learnflutter/shared_preferences/sp_home.dart';
import 'package:learnflutter/simple_game/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SpHome(),
    );
  }
}
