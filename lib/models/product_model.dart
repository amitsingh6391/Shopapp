// import 'package:json_annotation/json_annotation.dart';
// part 'product_model.g.dart';

// @JsonSerializable(createToJson: false)
class ProductModal {
  ProductModal({
    required this.status,
    required this.message,
    required this.totalRecord,
    required this.perPage,
    required this.totalPage,
    required this.data,
  });

  int status;
  String message;
  int totalRecord;
  int perPage;
  int totalPage;
  List<Datum> data;

  // factory ProductModal.fromJson(Map<String, dynamic> json) =>
  //     _$ProductModalFromJson(json);

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        status: json["status"],
        message: json["message"],
        totalRecord: json["totalRecord"],
        perPage: json["perPage"],
        totalPage: json["totalPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.price,
    required this.featuredImage,
    required this.status,
    required this.createdAt,
  });

  int id;
  String slug;
  String title;
  String description;
  int price;
  String featuredImage;
  String status;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        featuredImage: json["featured_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  @override
  String toString() {
    return 'ProductModel(productId:$id,image:$featuredImage,title:$title)';
  }
}
