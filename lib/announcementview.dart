import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:easy_church_json/easy_church_json.dart';

class SlidingCardsView extends StatefulWidget {
  SlidingCardsView({this.churchId});
  final String churchId;
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  EasyChurchJson easyChurchJson = EasyChurchJson();
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
    FutureBuilder(
    future: easyChurchJson.getAnnouncements(widget.churchId),
    initialData: <SingleAnnouncement>[],
    builder: ((BuildContext context,
    AsyncSnapshot<List<SingleAnnouncement>> snapshot) {
    if (!snapshot.hasData || snapshot.data.length < 0) {
    return Text(
    "There are no Announcements at this time",
    );
    }
    return ListView(
shrinkWrap: true,
    children: snapshot.data.map((evt) {
    return Container(
    child: SlidingCard(
    name: (evt.title),
    date: evt.description,
    offset: pageOffset,
    ),
    );
    }).toList());
    // return SlidingCard(
    //       name: (snapshot.data[0].title),
    //       date: snapshot.data[0].description,
    //       // assetName: 'punisher.jpeg',
    //       offset: pageOffset,
    //     );
    }),
    )
    ],
    );
  }
}

//height: MediaQuery.of(context).size.height * 0.55,
//      child: PageView(
//        controller: pageController,
//        children: <Widget>[
//          SlidingCard(
//            name:( 'We announce the wedding  of James Kinuthia & Eunice Kamau that would be held on Saturday 12/09/2019. Anyone who is against the wedding has 21 days from the day of annoncement to come foward and file a complaint.Thank you all and God bless you '
//
//               ),
//            date: 'Nov 09, 2019 8:14 p.m',
//            // assetName: 'punisher.jpeg',
//            offset: pageOffset,
//          ),
//          SlidingCard(
//            name: ('Those planning to attend the Kimathi childrens heart run should remember to tregister their names at the secretary before 16/09/2019. Thankyou and God bless you all '
//                ),
//            date: 'Nov 09, 2019 8:14 p.m',
//            //assetName: 'runaways.jpeg',
//            offset: pageOffset - 1,
//          ),
//        ],
//      ),
//    );
//  }
//}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  // final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    //@required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 60),
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              // child: Image.asset(
              // 'assets/$assetName',
              //  height: MediaQuery.of(context).size.height * 0.3,
              // alignment: Alignment(-offset.abs(), 0),
              //fit: BoxFit.none,
              // ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
        @required this.name,
        @required this.date,
        @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(1 * offset, 0),
            child: Text(name, style: TextStyle(color: Colors.black,fontSize: 14.0, fontFamily: "SF-Pro-Display-Bold" )),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(1 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.blueAccent,fontSize: 14.0, fontFamily: "SF-Pro-Display-Bold" ),
            ),
          ),

        ],
      ),
    );
  }
}