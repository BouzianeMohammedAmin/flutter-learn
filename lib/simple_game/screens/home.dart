import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var player = AudioCache();

  Map<String, bool> score = {};

  Map<String, Color> choices = {
    '❤': Colors.red,
    '💚': Colors.green,
    '💙': Colors.blue,
    '🧡': Colors.orange,
    '💜': Colors.purple,
    '🤎': Colors.brown,
  };

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((e) {
              return Expanded(
                child: Draggable<String>(
                  data: e,
                  child: Movable(emoji:score[e]== true ? '✔':e,),
                  feedback:Movable(emoji: e,),
                  childWhenDragging:Movable(emoji: "🐇",),
                ),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((e) {
              return BuildTarget(e);
            }).toList()..shuffle(Random(index)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          score.clear() ;
          index++ ;
        });
      },
      child: Icon(Icons.refresh),),
    );
  }

  Widget BuildTarget(elm) {

    return DragTarget<String>(
        onWillAccept: (data)=>data==elm,
        onAccept: (data){
          setState(() {
            score[elm] = true ;
            print("---------------------------------- \n ");
            player.play('clap.mp3');
            print("----------------------------------- \n ");
          });
        },

        builder: (context , incoming , rejected ){
      if(score[elm] == true){
        return Container(
          color: Colors.white,
          child: Text('Congratulation'),
          alignment: Alignment.center,
          height: 80,
          width: 200,

        );
      }else {
        return Container(
          color: choices[elm],
          width: 80,
          height: 100,
        );
      }
    });
  }
}
class Movable extends StatelessWidget {
  String emoji ;
  Movable({this.emoji}) ;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(
          emoji ,
          style: TextStyle(
            color: Colors.black ,
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
