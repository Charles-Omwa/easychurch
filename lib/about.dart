import 'package:flutter/material.dart';
import 'package:redo/main.dart';




class AboutUs extends StatelessWidget {
  String _textDetails = ''' Welcome to Langata West Church. we are located in langata next to Valley road mall. We have several branches spread out through the coutry ad worshipping with us will be your turning point in life
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
                        'Langata West',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ),

                    new Text('Kiserian Rd',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    new Text('P.O. BOX 1234',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    new Text('Nairobi Kenya 00800',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                  ],

                )),

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
            buildButtonColumn(context, Icons.phone, "call us"),
            //buildButtonColumn(context, Icons.map, ""),
            buildButtonColumn(context, Icons.email, "Email"),
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
        "https://churchinsurancemanagement.com/wp-content/uploads/2017/07/Modern-church-building.jpg",
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

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("About us"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new AboutUs(),
        bottomNavigationBar: BottomAppBar() );
  }
}