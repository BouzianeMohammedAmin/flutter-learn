import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/counter_provider.dart';
import 'package:learnflutter/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
