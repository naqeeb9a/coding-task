import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? email;
  String? password;
  int? id;

  UserModel({
    this.email,
    this.password,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "id": id,
      };
}
