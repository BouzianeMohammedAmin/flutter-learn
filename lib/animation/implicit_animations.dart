import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool _sizePic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sizePic = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            decoration: BoxDecoration(
                gradient: RadialGradient(
              colors: [Colors.black, Colors.white],
              stops: [_sizePic?0.2:0.8,1.0],
            )),
            duration: Duration(seconds: 4),
            width: _sizePic ? 100 : 500,
            child: Image.asset(
              'assets/images/star.png',
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  this._sizePic = !this._sizePic;
                });
              },
              child: Icon(Icons.settings_backup_restore),
            ),
          )
        ],
      ),
    );
  }
}
