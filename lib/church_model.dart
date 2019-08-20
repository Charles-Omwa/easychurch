class ChurchModel {
  final String avatarUrl;
  final String name;

  final String slogan;

  ChurchModel({this.avatarUrl, this.name,  this.slogan});

  static final List<ChurchModel> dummyData = [
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "BuruBuru PCEA",
      slogan: "Together We Rise",
    ),
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "ST Pauls ACK",
      slogan: "Together We Riseain Church",
    ),
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "Citam Karen",
      slogan: "Together We Rise",
    ),
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "1824, Langata",
      slogan: "Together We Rise",
    ),
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "P.A.G Kahawa",
      slogan: "Together We Rise",
    ),
    ChurchModel(
      avatarUrl: "https://image.shutterstock.com/image-vector/simple-church-icon-vector-brown-260nw-418393207.jpg",
      name: "Shauri Moyo Catholic",
      slogan: "Together We Rise",
    ),
  ];
}