class EventModel {
  final String avatarUrl;
  final String title;
  final String datetime;
  final String venue;

  EventModel({this.avatarUrl, this.title, this.datetime, this.venue});

  static final List<EventModel> dummyData = [
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "Annual Church party",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "Church tent",
    ),
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "Church Fundraising",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "Main Church",
    ),
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "Revival Week",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "Church hall",
    ),
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "21 days fasting",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "church pavillion",
    ),
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "Baptism",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "Baptism pool",
    ),
    EventModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      title: "Ordination",
      datetime: "Nov 09, 2019 8:14 p.m",
      venue: "Main church",
    ),
  ];
}