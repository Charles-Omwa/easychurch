import 'package:easy_church_json/easy_church_json.dart';
import 'package:flutter/material.dart';
import 'package:redo/event.dart';
import 'package:redo/components/notepage.dart';
import 'package:redo/components/media.dart';
import 'package:redo/components/photos.dart';
import 'package:redo/church.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redo/annoncement.dart';
import 'package:redo/contribution.dart';
import 'package:redo/bible.dart';
import 'package:redo/about.dart';
import 'package:redo/profile.dart';
import 'package:redo/prayerpage.dart';
import 'package:redo/components/addtocalendar.dart';

void main() {
  runApp(MaterialApp(
    home: ChurchScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  Home({this.singleChurch,this.church_id});

  final SingleChurch singleChurch;
  final church_id;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.singleChurch.name,
            style:
                TextStyle(fontSize: 15.0, fontFamily: "SF-Pro-Display-Bold")),
        elevation: 0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotePage(
                        churchId: widget.singleChurch.id,
                      ),
                    ),
                  );
                },
                icon: Stack(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
//                    Positioned(
//                      child: Icon(
//                        Icons.brightness_1,
//                        color: Colors.red,
//                        size: 9.0,
//                      ),
//                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[ new UserAccountsDrawerHeader(
            accountName: Text(widget.singleChurch.name,),
           // accountEmail: Text (widget.singleChurch.bio),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage("https://mirickoconnelllawblog.files.wordpress.com/2013/07/white_church.jpg"),
                backgroundColor: Colors.grey,

               // backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.blue

            ),
          ),
            //  header

//            DrawerHeader(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    widget.singleChurch.name,
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ],
//              ),
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('assets/images/bg1.jpg'),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoPage()),
                );
              },
              child: ListTile(
                title: Text('Photos'),
                leading: Icon(
                  Icons.photo,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContributionPage()),
                );
              },
              child: ListTile(
                title: Text('Contributions'),
                leading: Icon(
                  Icons.business_center,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bible()),
                );
              },
              child: ListTile(
                title: Text('Bible'),
                leading: Icon(
                  Icons.book,
                  color: Colors.blue,
                ),
              ),
            ),
//            Divider(
//              color: Colors.blue,
//            ),
//            InkWell(
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Profile()),
//                );
//              },
//              child: ListTile(
//                title: Text('Profile'),
//                leading: Icon(
//                  Icons.account_box,
//                  color: Colors.blue,
//                ),
//              ),
//            ),
            Divider(
              color: Colors.blue,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              child: ListTile(
                title: Text('About Us '),
                leading: Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreeTopPart(),
            HomeScreenBottomPart(widget.singleChurch)
          ],
        ),
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
                      MaterialPageRoute(
                        builder: (context) =>
                            ChurchScreen(),
                      ));
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
                            EventScreen(church_id: widget.singleChurch.id),
                      ));
                },
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}

class HomeScreeTopPart extends StatefulWidget {
  HomeScreeTopPart({this.churchId});
  final String churchId;
  @override
  _HomeScreeTopPartState createState() => _HomeScreeTopPartState();
}

class _HomeScreeTopPartState extends State<HomeScreeTopPart> {
  EasyChurchJson easyChurchJson = EasyChurchJson();
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 250.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0)
              ]),
              child: Stack(
                children: <Widget>[

                  Image.network("https://www.rainbowtoken.com/wp-content/uploads/2018/04/bible-verse-of-the-dayProverbs-1-32-Hardship-is-the-Gods-blessing.jpg",
                      fit: BoxFit.cover, width: double.infinity),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333)
                        ],
                            stops: [
                          0.0,
                          0.9
                        ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0))),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            right: -20.0,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.thumb_up,
                      color: (Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),

                    child: RaisedButton(

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Announcement(),
                            ));
                      },
                      color: (Colors.blueAccent),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Announcements",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                          )
                        ],
                      ),

                    ),

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatefulWidget {
  HomeScreenBottomPart(this.singleChurch);

  final SingleChurch singleChurch;

  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  String IMEI = "";
  int state = 0;

  @override
  void initState() {
    super.initState();

    getImei();
    getUserState();
  }

  void getImei() async {
    var imei = await ImeiPlugin.getImei;
    IMEI = imei.toString();
  }

  List<String> images = [
    "assets/images/pray.jpg",
    "assets/images/reminder.png",
  ];

  List<String> titles = ["Send Prayer", "Reminder"];

  List<Widget> activity() {
    List<Widget> activityList = new List();

    for (int i = 0; i < 2; i++) {
      var activityitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Container(
          height: 110.0,
          width: 110.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(10.0, 12.0))
              ]),
          child: Column(
            children: <Widget>[
              //new GestureDetector(onTap: (){},),
              InkWell(
                onTap: () {
                  if(i == 0){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrayerPage()),
                        );

                  }else{Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reminder()),
                  );

                  }
                },
                
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Image.asset(
                    images[i],
                    width: double.infinity,
                    height: 90.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "SF-Pro-Display-Bold")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
              )
            ],
          ),
        ),
      );
      activityList.add(activityitem);
    }
    return activityList;
  }

  void saveUserState() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("church", widget.singleChurch.id);
  }

  void getUserState() async {
    var pref = await SharedPreferences.getInstance();
    String church = pref.getString("church");

    if (church != null && church == widget.singleChurch.id) {
      state = 1;
    } else if (church != null) {
      state = 2;
    } else {
      state = 0;
    }
    setState(() {});
  }

  void followChurch() async {
    EasyChurchJson easyChurchJson = new EasyChurchJson();
    String text =
        await easyChurchJson.followChurch(widget.singleChurch.id, IMEI);
    if (text == 'Success') {
      saveUserState();
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Successfully followed ${widget.singleChurch.name}")));
    } else if (text == 'Network Fail') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content:
              Text("Failed to follow  church, check your network connection")));
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Failed to follow  church, try again")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 280.0,
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: activity(),
              //new GestureDetector(onTap: (){}
            ),
          ),
          state == 0 || state == 1
              ? Transform.translate(
                  offset: const Offset(120.0, 20.0),
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                    child: Transform.translate(
                      offset: const Offset(1.0, 4.0),
                      child: Text(state == 0 ? 'Follow' : 'Following',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: "SF-Pro-Display-Bold")),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    onPressed: () {
                      if (state == 0) {
                        followChurch();
                      }
                    },
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
