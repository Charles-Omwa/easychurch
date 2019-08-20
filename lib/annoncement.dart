import 'package:flutter/material.dart';
import 'package:redo/announcementview.dart';
import 'package:redo/event.dart';
import 'package:redo/components/media.dart';
import 'package:redo/church.dart';
import 'package:redo/components/notepage.dart';

class Announcement extends StatefulWidget {
  final String churchId;

  Announcement({Key key, this.churchId}) : super(key: key);
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
        elevation: 0,


      ),

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home),
              color: Colors.blueAccent,

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ChurchScreen()),

                );
              },

            ),

            ),


            Expanded(child: IconButton(icon: Icon(Icons.event_note),color: Colors.blueAccent,
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>EventScreen()),

                );

              },
            ),
            ),
            // Expanded(child: IconButton(icon: Icon(Icons.notifications),color: Colors.blueAccent,
            //   onPressed: () {

            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) =>NotePage()),

            //     );
            //   },
            // ),
            // ),
            Expanded(child: IconButton(icon: Icon(Icons.perm_media),color: Colors.blueAccent,
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MediaPage()),

                );
              },
            ),
            ),
            // Expanded(child: IconButton(icon: Icon(Icons.more_horiz),color: Colors.blueAccent,
            //   onPressed: () {},
            // ),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 3.0),
                //Header(),
                //SizedBox(height: 40),

                SizedBox(height: 40),
                SlidingCardsView(),
              ],
            ),
          ),
          //ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}

