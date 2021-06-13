// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.age,
    this.colour,
  });

  String name;
  int age;
  String colour;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    age: json["age"],
    colour: json["colour"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "colour": colour,
  };
}
