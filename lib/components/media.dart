import 'package:redo/components/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:redo/event.dart';
import 'package:redo/church.dart';



class MediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sermons'),
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
            // Expanded(child:  IconButton(icon: Icon(Icons.more_horiz),color: Colors.blueAccent,
            //   onPressed: () {},
            // ),
            // ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[

      Padding(padding: EdgeInsets.only(bottom: 18.0),),
    Text('True Believer', style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontFamily: "SF-Pro-Display-Bold")),
          SizedBox(
    width: 20.0,
    ),
          Text('Pst Kinuthia', style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 13.0,
              fontFamily: "SF-Pro-Display-Bold"),),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/videos/IntroVideo.mp4',

            ),


            looping: true,
          ),
          Divider(color: Colors.blue,),

          Padding(padding: EdgeInsets.only(bottom: 18.0),),
          Text('Revival', style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: "SF-Pro-Display-Bold")),
          SizedBox(
            width: 20.0,
          ),
          Text('Rev Omwa', style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 13.0,
              fontFamily: "SF-Pro-Display-Bold"),),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            ),
          ),
          Divider(color: Colors.blue,),

          Padding(padding: EdgeInsets.only(bottom: 18.0),),
          Text('Prayer & Fasting', style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: "SF-Pro-Display-Bold")),
          SizedBox(
            width: 20.0,
          ),

          Text('Rev Gitau', style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 13.0,
              fontFamily: "SF-Pro-Display-Bold"),),
          ChewieListItem(

            videoPlayerController: VideoPlayerController.network(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            ),
          ),
        ],
      ),
    );
  }
}