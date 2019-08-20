import 'package:flutter/material.dart';
import 'package:redo/layoutfav.dart';


class Eventinfo extends StatelessWidget {
  String _textDetails = '''
  Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
  ''';

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        'Revival Worship',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ),

                    new Text('Pastor : Mawira Ike',
                        style: new TextStyle(color: Colors.black)),
                   new Text('Venue : Church Tent',
                        style: new TextStyle(color: Colors.grey)),
                    new Text('Date: 21/09/2019',
                       style: new TextStyle(color: Colors.grey)),
                new Text('Time : 8:30 pm to 9:30 pm ',
                     style: new TextStyle(color: Colors.grey))
                  ],
                )),
            new FavoriteWidget()
          ],
        ));

    IconTheme iconTheme = new IconTheme(
      data: new IconThemeData(color: Theme.of(context).primaryColor),
      child: titleSection,
    );

    /*
        Button Row
       */

    Container rowCont = new Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //we cannot do this beacause it requires sign in but he said they dont want sign in so instead im using a webview.
            buildButtonColumn(context, Icons.calendar_today, "add to calender"),
            buildButtonColumn(context, Icons.map, "Route"),
            buildButtonColumn(context, Icons.share, "Share"),
          ],
        ));

    /*
        Text Section
       */

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        _textDetails,
        style: new TextStyle(fontWeight: FontWeight.w500),
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    /*
        Image  Section
     */

    Widget imageSection = new Container(
      child: new Image.network(
        "https://i.pinimg.com/originals/f3/86/70/f38670ec8fbc5f6333f3d7db8cb03b0a.jpg",
        height: 240.0,
        fit: BoxFit.contain,
      ),
    );

    /*
        Main Column
       */

    Widget mainCol = new ListView(
      children: <Widget>[
        imageSection,
        iconTheme,
        rowCont,
        textSection,
      ],
    );

    Container mainContainer = new Container(
      child: mainCol,
    );

    return mainContainer;
  }

  Column buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label.toUpperCase(),
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

//class LayoutApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new LayoutScaffold(),
//        theme: new ThemeData(primarySwatch: Colors.pink));
//  }
//}

class EventLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Event Info"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Eventinfo());
  }
}