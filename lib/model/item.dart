class Item {
  String imgPath;
  String name;
  double price;
  String location;
  Item(
      {required this.imgPath,
      required this.price,
      required this.location,
      required this.name});
}

final List<Item> items = [
  Item(
      name: "Product 1",
      imgPath: "assets/img/1.webp",
      price: 49.99,
      location: "Kazan Shop"),
  Item(
      name: "Product 2",
      imgPath: "assets/img/2.webp",
      price: 54.99,
      location: "Chelny Shop"),
  Item(
      name: "Product 3",
      imgPath: "assets/img/3.webp",
      price: 44.99,
      location: "Moscow Shop"),
  Item(
      name: "Product 4",
      imgPath: "assets/img/4.webp",
      price: 29.99,
      location: "Peter Shop"),
  Item(
      name: "Product 5",
      imgPath: "assets/img/5.webp",
      price: 79.99,
      location: "Samara Shop"),
  Item(
      name: "Product 6",
      imgPath: "assets/img/6.webp",
      price: 84.99,
      location: "Omsk Shop"),
  Item(
      name: "Product 7",
      imgPath: "assets/img/7.webp",
      price: 14.99,
      location: "Ufa Shop"),
  Item(
      name: "Product 8",
      imgPath: "assets/img/8.webp",
      price: 64.99,
      location: "Perm Shop"),
];
