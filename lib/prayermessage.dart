import 'package:flutter/material.dart';

const String _name = "Me";

class ChatMessage extends StatelessWidget {
  final String text ;
  
  ChatMessage({this.text});
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: new CircleAvatar(
              child: new Text(_name[0],style: TextStyle(color: Colors.white),),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name,style:TextStyle(color: Colors.blue),),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}