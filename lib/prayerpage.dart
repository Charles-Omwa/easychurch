import 'package:flutter/material.dart';
import 'package:redo/sendprayer.dart';

class PrayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Send Prayer"),
      ),
      body: new ChatScreen()
    );
  }
}