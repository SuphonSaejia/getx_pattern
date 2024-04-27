import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  String name;
  String imageUrl;
  String desc;
  String price;
  Type type;
  String id;
  String departmentId;

  Product({
    required this.name,
    required this.imageUrl,
    required this.desc,
    required this.price,
    required this.type,
    required this.id,
    required this.departmentId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        desc: json["desc"] ?? "",
        price: json["price"] ?? "",
        type: typeValues.map[json["type"] ?? "normal"]!,
        id: json["id"] ?? "",
        departmentId: json["departmentId"] ?? "",
      );
}

// ignore: constant_identifier_names
enum Type { NORMAL, SPACIAL }

final typeValues = EnumValues({"normal": Type.NORMAL, "spacial": Type.SPACIAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
