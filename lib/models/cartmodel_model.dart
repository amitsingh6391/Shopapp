// ignore: file_names

class CartModel {
  int productId;
  String image;
  String name;
  int price;

  num numOfItems;

  CartModel({
    required this.productId,
    required this.image,
    required this.name,
    required this.numOfItems,
    required this.price,
  });
}
