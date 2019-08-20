import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './church_model.dart';
import 'package:redo/main.dart';
import 'package:easy_church_json/easy_church_json.dart';

class ChurchScreen extends StatefulWidget {
  @override
  _ChurchScreenState createState() => _ChurchScreenState();
}

class _ChurchScreenState extends State<ChurchScreen> {
  EasyChurchJson easyChurchJson = new EasyChurchJson();
  int saveState;
  String churchName;

  @override
  void initState() {
    super.initState();

    getUserState();
  }

  void getUserState() async {
    var pref = await SharedPreferences.getInstance();
    String church = pref.getString("church");

    if (church != null) {
      //We have to show another page here, the home page
      //This is only positive if he has successfully followed a church

      setState(() {
        saveState = 1;
        churchName = church;
      });
    } else {
      setState(() {
        saveState = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (saveState == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (saveState == 1) {
      return FutureBuilder(
          future: easyChurchJson.getAllChurches(),
          initialData: <SingleChurch>[],
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            }
            if (snapshot.data.length < 1) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.data.length > 1) {
              List<SingleChurch> ls = snapshot.data;
              for (int i = 0; i < ls.length; i++) {
                if (ls[i].name == churchName) {
//                  Navigator.push(context, MaterialPageRoute(builder: (context) {
//                    return Home(singleChurch: ls[i]);
//                  }));
                  return Home(singleChurch: ls[i]);
                }
              }

              return new ChurchesBody(easyChurchJson: easyChurchJson);
            }
          });
    } else {
      return new ChurchesBody(easyChurchJson: easyChurchJson);
    }
  }


}

class ChurchesBody extends StatelessWidget {
  const ChurchesBody({
    Key key,
    @required this.easyChurchJson,
  }) : super(key: key);

  final EasyChurchJson easyChurchJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Churches'),
        elevation: 0,

      ),
      body: Container(
        child: FutureBuilder(
            future: easyChurchJson.getAllChurches(),
            initialData: <SingleChurch>[],
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox();
              }
              if (snapshot.data == null) {
                //I have put this here as this is the most possible place for the error
                //The plugin returns a null during (!response.statusCode == 200)
                //And  (http.ClientException) so when the program found null it
                // displayed the if statement above of displaying nothing
                //However the exact problem should show on the phones, i think
                // its a case for people with bad connections and not the phones difference
                // TODO Tell one to test now so that we know this is the exact spot of the problem
                //so ill have to make another apk?
                //YES
                //sawa lets tackle the other areas i will make the apk with the updates
                // Ok
                //Navigate o the other code ya events ama you fixing story ya kudisable page ya churches once subscribed
                //Iko wapi?
                // haileti anything it just displays the circular progress indicator
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Text("Error")],
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 10.0,
                      ),
                      ListTile(
//                      leading: CircleAvatar(
//                        radius: 20.0,
//                        backgroundImage: NetworkImage(_model.avatarUrl),
//                      ),
                        title: Row(
                          children: <Widget>[
                            Text(
                              snapshot.data[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "SF-Pro-Display-Bold"),
                            ),
                            SizedBox(
                              width: 1.0,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          snapshot.data[index].bio != null
                              ? snapshot.data[index].bio
                              : "",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14.0,
                              fontFamily: "SF-Pro-Display-Bold"),
                        ),

                        trailing: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.blueAccent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(
                                      singleChurch: snapshot.data[index])),
                            );
                          },
                          child: new Text("View"),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
