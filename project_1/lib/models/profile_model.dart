// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    final String? message;
    final Data? data;

    ProfileModel({
        this.message,
        this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final String? userpic;
    final String? name;
    final String? phonenumber;

    Data({
        this.id,
        this.userpic,
        this.name,
        this.phonenumber,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userpic: json["userpic"],
        name: json["name"],
        phonenumber: json["phonenumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userpic": userpic,
        "name": name,
        "phonenumber": phonenumber,
    };
}
