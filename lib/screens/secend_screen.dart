import 'package:flutter/material.dart';
import 'package:learnflutter/inherited_widget/counter_provider.dart';

class SecendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Secend Screen "),
      ),
      body: Center(
        child: StatefulBuilder(builder: (context, StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${provider.counter}',
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
                      provider.counter++;
                    });
                  }),
            ],
          );
        }),
      ),
    );
  }
}
