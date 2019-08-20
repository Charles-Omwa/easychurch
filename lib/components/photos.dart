import 'package:flutter/material.dart';
import 'package:redo/main.dart';


class PhotoPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {

    return new PhotoPageState();
  }
}

class PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Photos',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: OrientationBuilder(builder: (context,orientation){
      return GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2:3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 0.0,
        children: List.generate(4, (index) {
          return Image.asset('assets/images/photo$index.jpg',
            width: 200.0,
            height: 200.0,
          );
          }
          ),
          );

            }
    )
    );

  }

}
