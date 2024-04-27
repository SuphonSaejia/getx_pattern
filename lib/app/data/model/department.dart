import 'dart:convert';

List<Department> departmentFromJson(String str) =>
    List<Department>.from(json.decode(str).map((x) => Department.fromJson(x)));

class Department {
  String name;
  String imageUrl;
  String id;

  Department({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json["name"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        id: json["id"] ?? "",
      );
}
