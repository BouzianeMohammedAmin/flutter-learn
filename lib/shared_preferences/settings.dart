import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int color = Colors.white.value ;
  SharedPreferences pref ;
  saveData(int color ) async{
    pref = await SharedPreferences.getInstance();
    pref.setInt('favC', color);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Color(color),
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile(
            value: Colors.green.value,
            groupValue: color,
            onChanged: (int c ){
              setState(() {
                color=c;
                saveData(color);

              });
            },
            title: Text('Green'),
          ),
          RadioListTile(
            value: Colors.red.value,
            groupValue: color,
            onChanged: (int c ){
              setState(() {
                color=c;
                saveData(color);
              });
            },
            title: Text('Red'),
          ),
          RadioListTile(
            value: Colors.blue.value,
            groupValue: color,
            onChanged: (int c ){
              setState(() {
                color=c;
                saveData(color);

              });
            },
            title: Text('Blue'),
          ),

        ],
      ),
    );
  }
}
