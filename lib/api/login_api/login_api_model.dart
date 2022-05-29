// To parse this JSON data, do
//
//     final LoginApiModel = LoginApiModelFromJson(jsonString);

import 'dart:convert';

import 'package:image_picker/image_picker.dart';

LoginApiModel loginApiModelFromJson(String str) =>
    LoginApiModel.fromJson(json.decode(str));

String loginApiModelToJson(LoginApiModel data) => json.encode(data.toJson());

class LoginApiModel {
  LoginApiModel({
    required this.user,
    required this.token,
    required this.message,
  });

  User user;
  String token;
  String message;

  factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "message": message,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.blood,
    required this.password,
    required this.image,
    required this.access,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
  });

  String id;
  String firstName;
  String secondName;
  int age;
  String gender;
  String email;
  String phone;
  String blood;
  String password;
  XFile? image;
  bool access;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int otp;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        blood: json["blood"],
        password: json["password"],
        image: json["image"],
        access: json["access"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "secondName": secondName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "blood": blood,
        "password": password,
        "image": image,
        "access": access,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "otp": otp,
      };
}
