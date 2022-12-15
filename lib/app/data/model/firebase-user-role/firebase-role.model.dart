// To parse this JSON data, do
//
//     final firebaseRoles = firebaseRolesFromJson(jsonString);

import 'dart:convert';

FirebaseRoles firebaseRolesFromJson(String str) =>
    FirebaseRoles.fromJson(json.decode(str));

String firebaseRolesToJson(FirebaseRoles data) => json.encode(data.toJson());

class FirebaseRoles {
  FirebaseRoles({
    required this.admin,
    required this.analis,
    required this.reviewer,
    required this.pengutus,
  });

  bool admin;
  bool analis;
  bool reviewer;
  bool pengutus;

  factory FirebaseRoles.fromJson(Map<String, dynamic> json) => FirebaseRoles(
        admin: json["admin"],
        analis: json["analis"],
        reviewer: json["reviewer"],
        pengutus: json["pengutus"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "analis": analis,
        "reviewer": reviewer,
        "pengutus": pengutus,
      };
}
