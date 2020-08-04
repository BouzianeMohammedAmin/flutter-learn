import 'package:flutter/material.dart';
import 'package:learnflutter/shared_preferences/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SpHome extends StatefulWidget {
  @override
  _SpHomeState createState() => _SpHomeState();
}

class _SpHomeState extends State<SpHome> {
  SharedPreferences pref;
  int color=Colors.white.value ;
  getColor() async{
    pref = await SharedPreferences.getInstance() ;
setState(() {
  this.color = pref.getInt('favC') ?? Colors.white ;

});
  }
  @override
  Widget build(BuildContext context) {
    getColor();
    return Scaffold(
      backgroundColor: Color(color),
      appBar: AppBar(
        title: Text('SharedPreferences'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
            /*  Navigator().push(MaterialPageRoute(builder: (BuildContext ctx){
                return Settings();
              }));*/
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
              return Settings();
            }));
            },
          ),
        ],
      ),
      body: null,
    );
  }
}
