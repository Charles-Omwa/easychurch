import 'package:flutter/material.dart';



class VideoCard extends StatelessWidget {
  //VideoCard(this.video);
  //final Video video;

  BoxDecoration _buildShadowAndRoundedCorners() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius:0.0,
          blurRadius: 1.0,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/prayer.png'),
          Positioned(
            bottom: 3.0,
            right: 2.0,
            child: _buildPlayButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayButton() {
    return Material(
      color: Colors.blueAccent,
      type: MaterialType.circle,
      child: InkWell(
        onTap: ()  {

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),

      ),

    );

  }




  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left:16.0, right: 4.0),
      child: Text(
        "Send Prayer",
        style: TextStyle(color: Colors.blueAccent,fontSize: 13.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal:100, vertical: 200),
      decoration: _buildShadowAndRoundedCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 3, child: _buildThumbnail()),
          Flexible(flex: 2, child: _buildInfo()),
        ],
      ),
    );
  }
  //***********************************************************************************************************************************
  


  //***********************************************************************************************************************************
}