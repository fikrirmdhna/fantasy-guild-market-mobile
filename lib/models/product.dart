// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    String model;
    int pk;
    Fields fields;

    Products({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int amount;
    String description;
    int price;
    int power;
    DateTime dateAdded;
    int user;

    Fields({
        required this.name,
        required this.amount,
        required this.description,
        required this.price,
        required this.power,
        required this.dateAdded,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        price: json["price"],
        power: json["power"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
    );

    // factory Fields.fromJsontoArray(Map<String, dynamic> json) => Fields(
    //     var list = json['items'] as List;
    //     List<Products> itemsList = list.map((i) => Item.fromJSON(i)).toList();
    //     name: json["name"],
    //     amount: json["amount"],
    //     description: json["description"],
    //     price: json["price"],
    //     power: json["power"],
    //     dateAdded: DateTime.parse(json["date_added"]),
    //     user: json["user"],
    // );


    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "description": description,
        "price": price,
        "power": power,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user,
    };
}
