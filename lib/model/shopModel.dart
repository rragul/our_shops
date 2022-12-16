import 'dart:convert';

Shops shopsFromJson(String str) => Shops.fromJson(json.decode(str));

String shopsToJson(Shops data) => json.encode(data.toJson());

class Shops {
  Shops({
    required this.image,
    required this.location,
    required this.name,
  });

  String image;
  String location;
  String name;

  factory Shops.fromJson(Map<String, dynamic> json) => Shops(
        image: json["image"],
        location: json["location"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "location": location,
        "name": name,
      };
}
