import 'package:flutter/material.dart';
import './event_model.dart';
import 'package:redo/components/notepage.dart';
import 'package:redo/church.dart';
//import 'package:redo/main.dart';
import 'package:redo/components/media.dart';
import 'package:redo/eventinfo.dart';
import 'package:easy_church_json/easy_church_json.dart';
import 'package:carousel_pro/carousel_pro.dart';

class EventScreen extends StatefulWidget {
  EventScreen({this.church_id ,this.singleChurch});
  final String church_id;
  final SingleChurch singleChurch;

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EasyChurchJson easyChurchJson = new EasyChurchJson();
  List<bool> isExpandedList = [];

  void makeListFalse(int count) {
    isExpandedList = new List(count);

    isExpandedList.forEach((item) => {item = false});
  }

  int getItemCount(SingleEvent evt, List<SingleEvent> list) {
    int index = 0;
    list.forEach((evt2) {
      if (evt2.id == evt.id) {
        return index;
      }
      index++;
    });
  }

  List<Widget> getListWidget(List<SingleEvent> data) {
    return data.map((SingleEvent evt) {
      return ExpansionTile(
        title: ListTile(
          title: Text(evt.title),
        ),
        children: <Widget>[
          ListTile(title: Text(evt.description,), subtitle: Text(evt.dueDate,))
        ],
      );
    }).toList();
  }

  @override

  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 150.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/Eventbanner.png'),
        ],
        autoplay: false,
        //animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        elevation: 0,

        //leading: IconButton(
        //icon: Icon(Icons.arrow_back),
        // onPressed: (){
        //Navigator.push(
        //  context,
        // MaterialPageRoute(builder: (context) =>Home()),
        //  );
        // },
        //  ),
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
                      MaterialPageRoute(
                        builder: (context) =>
                            EventScreen(),
                      ));
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
      body:
    new Column(
    children: <Widget>[
    //image carousel begins here
    image_carousel,
      FutureBuilder(
          future: easyChurchJson.getEvents(widget.church_id),
          initialData: <SingleEvent>[],
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              makeListFalse(snapshot.data.length);
            }

            return snapshot.data.length > 0
                ? ListView(
                    shrinkWrap: true,
                    children: getListWidget(snapshot.data),
                  )
                : Text('There are no events at the moment.');
          }),

    ]));
  }
}
