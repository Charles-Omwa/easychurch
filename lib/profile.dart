import 'package:flutter/material.dart';





class Profile extends StatelessWidget {
  Color gradientStart = Colors.orange[200]; //Change start gradient color here
  Color gradientEnd = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
// background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [gradientStart, gradientEnd],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                  child: Center(
                    child: Text('Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic)),
                  )),
              Expanded(
                child:Container(
                  margin:EdgeInsets.only(top:160),
                  child:Column(children: <Widget>[
                    new Center(
                      child:Text('Langata West',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16)),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation:20,
                          child: Container(
                            width:80,
                            child: Center(
                                child:Text('Followers\n  600')
                            ),
                          ),
                        ),
                        Card(
                          elevation:20,
                          child: Container(
                            width:80,
                            child: Center(
                                child:Text('Branches\n  4')
                            ),
                          ),
                        ),
                        Card(
                          elevation:20,
                          child: Container(
                            width:80,
                            child: Center(
                                child:Text('Likes\n  200')
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(height:50,color:Colors.grey),


                    Container(
                      margin:EdgeInsets.only(top: 0,left:100),
                      child:Column(children: <Widget>[
                        Row(children: <Widget>[
                          Text('Church Profile',style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold),)
                        ],),
                        Row(children:<Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('- Started in 24/09/2003'),
                              Text('- Founded by James Kimaru'),
                              Text('- Branches in Ngong ,Narok & Kisumu'),
                              Text('- Has an affiliate school in Ngong'),
                            ],)
                        ],)
                      ],
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
          Positioned(
              top:150,
              child:Container(
                height:200,
                width: 200,
                child:CircleAvatar(
                  backgroundImage: AssetImage('assets/images/church.jpg'),
                ),
              ))
        ],

      ),

    );


  }
}

class Profileinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Church Profile"),
          backgroundColor: Theme
              .of(context)
              .primaryColor,
        ),
        body: new Profile());
  }
}
