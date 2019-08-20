import 'package:flutter/material.dart';

class ContributionPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    final topContentText = Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[






        Container(

          width: 90.0,

          child: new Divider(color: Colors.blue),

        ),

        //SizedBox(height: 190.0),



      ],

    );
    final topContent = Stack(

      children: <Widget>[

        Container(

            padding: EdgeInsets.only(left: 10.0),

            height: MediaQuery.of(context).size.height * 0.5,

            decoration: new BoxDecoration(

              image: new DecorationImage(

                image: new AssetImage("assets/images/lipa.png" ),

                fit: BoxFit.contain,

              ),

            )),

        Container(

          height: MediaQuery.of(context).size.height * 0.5,

          padding: EdgeInsets.all(40.0),

          width: MediaQuery.of(context).size.width,

          child: Center(

            child: topContentText,

          ),

        ),
        Positioned(

          left: 8.0,

          top: 60.0,

          child: InkWell(

            onTap: () {

              Navigator.pop(context);

            },

            child: Icon(Icons.arrow_back, color: Colors.white),

          ),

        )

      ],

    );
    final bottomContentText = Text(

      "1. Go to M-pesa\n"
          "2. Select lipa na Mpesa\n"
          "3. Select Paybill\n"
          "4. Enter Business no(888888)\n"
          "5. Enter account no (Your Phone no)\n"
          "6. Enter Amount\n"
          "7. Enter your mpesa pin and press ok\n",
      style: TextStyle(fontSize: 18.0, letterSpacing: 0.4,),

    );

    final readButton = Container(

      padding: EdgeInsets.symmetric(vertical: 0.0),

      width: MediaQuery.of(context).size.width,

    );

    final bottomContent = Container(

      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(0.0),

      child: Center(

        child: Column(

          children: <Widget>[bottomContentText, readButton],

        ),

      ),

    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Tithe'),
        elevation: 0,


      ),

      body: Column(

        children: <Widget>[topContent, bottomContent],

      ),

    );

  }

}