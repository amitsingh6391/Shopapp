// ignore: file_names
import 'package:ecommerce_app/models/product_model.dart';

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

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['product_id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      numOfItems: json['no_of_items'] as num,
      price: json[''] as int,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'product_id': productId,
        'image': image,
        'name': name,
        'no_of_items': numOfItems,
      };

  factory CartModel.fromProduct(Datum productModel, num numOfItems) {
    return CartModel(
        productId: productModel.id,
        image: productModel.featuredImage,
        name: productModel.slug,
        numOfItems: numOfItems,
        price: productModel.price);
  }
}
