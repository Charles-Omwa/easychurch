import 'package:flutter/material.dart';
import 'package:redo/components/notification.dart';
import 'package:redo/event.dart';
import 'package:redo/components/media.dart';
import 'package:redo/church.dart';
//import 'package:redo/Intropage.dart';
//import 'package:easy_church_json/easy_church_json.dart';

class NotePage extends StatefulWidget {
  final String churchId;

  NotePage({Key key, this.churchId}) : super(key: key);
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  //EasyChurchJson easyChurchJson = new EasyChurchJson();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easychurch'),
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChurchScreen()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.event_note),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventScreen()),
                  );
                },
              ),
            ),
            // Expanded(
            //   child: IconButton(
            //     icon: Icon(Icons.notifications),
            //     color: Colors.blueAccent,
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => NotePage()),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.perm_media),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediaPage()),
                  );
                },
              ),
            ),
            // Expanded(
            //   child: IconButton(
            //     icon: Icon(Icons.more_horiz),
            //     color: Colors.blueAccent,
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SlidingCardsView(
        churchId: widget.churchId,
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Text(
        'Notifications',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
