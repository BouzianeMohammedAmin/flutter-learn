import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/counter_provider.dart';
import 'package:learnflutter/screens/secend_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterProvider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecendScreen();
                }));
              }),
        ],
      ),
      body: Center(
        child: StatefulBuilder(builder: (context, StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${counterProvider.counter}',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 40,
                  onPressed: () {
                    setState(() {
                      counterProvider.counter++;
                    });
                  }),
            ],
          );
        }),
      ),
    );
  }
}
