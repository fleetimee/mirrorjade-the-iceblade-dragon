// To parse this JSON data, do
//
//     final firebaseUsers = firebaseUsersFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

FirebaseUsers firebaseUsersFromJson(String str) =>
    FirebaseUsers.fromJson(json.decode(str));

String firebaseUsersToJson(FirebaseUsers data) => json.encode(data.toJson());

class FirebaseUsers {
  FirebaseUsers({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory FirebaseUsers.fromJson(Map<String, dynamic> json) => FirebaseUsers(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.users,
  });

  List<User>? users;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: json["users"] == null
            ? null
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? null
            : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.uid,
    this.emailVerified,
    this.disabled,
    this.photoUrl,
    this.passwordHash,
    required this.phoneNumber,
    this.passwordSalt,
    this.metadata,
    this.providerData,
    this.email,
    this.displayName,
    this.customClaims,
    this.tokensValidAfterTime,
  });

  String? uid;
  bool? emailVerified;
  bool? disabled;
  Metadata? metadata;
  String? photoUrl;
  String phoneNumber;

  List<ProviderDatum>? providerData;
  CustomClaims? customClaims;
  String? passwordHash;
  String? passwordSalt;
  String? email;
  String? displayName;
  String? tokensValidAfterTime;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        emailVerified: json["emailVerified"],
        disabled: json["disabled"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        photoUrl: json["photoURL"] == null ? null : json["photoURL"],
        passwordHash:
            json["passwordHash"] == null ? null : json["passwordHash"],
        passwordSalt:
            json["passwordSalt"] == null ? null : json["passwordSalt"],
        providerData: json["providerData"] == null
            ? null
            : List<ProviderDatum>.from(
                json["providerData"].map((x) => ProviderDatum.fromJson(x))),
        customClaims: json["customClaims"] == null
            ? null
            : CustomClaims.fromJson(json["customClaims"]),
        email: json["email"],
        displayName: json["displayName"],
        tokensValidAfterTime: json["tokensValidAfterTime"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "emailVerified": emailVerified,
        "disabled": disabled,
        "metadata": metadata == null ? null : metadata?.toJson(),
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "photoURL": photoUrl == null ? null : photoUrl,
        "providerData": providerData == null
            ? null
            : List<dynamic>.from(providerData!.map((x) => x.toJson())),
        "passwordHash": passwordHash == null ? null : passwordHash,
        "passwordSalt": passwordSalt == null ? null : passwordSalt,
        "customClaims": customClaims == null ? null : customClaims?.toJson(),
        "email": email,
        "displayName": displayName,
        "tokensValidAfterTime": tokensValidAfterTime,
      };
}

class Metadata {
  Metadata({
    this.lastSignInTime,
    this.creationTime,
    this.lastRefreshTime,
  });

  String? lastSignInTime;
  String? creationTime;
  String? lastRefreshTime;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        lastSignInTime: json["lastSignInTime"],
        creationTime: json["creationTime"],
        lastRefreshTime: json["lastRefreshTime"],
      );

  Map<String, dynamic> toJson() => {
        "lastSignInTime": lastSignInTime,
        "creationTime": creationTime,
        "lastRefreshTime": lastRefreshTime,
      };
}

class CustomClaims {
  CustomClaims({
    required this.admin,
    required this.analis,
    required this.reviewer,
    required this.pengutus,
  });

  bool admin;
  bool analis;
  bool reviewer;
  bool pengutus;

  factory CustomClaims.fromJson(Map<String, dynamic> json) => CustomClaims(
        admin: json["admin"] == null ? null : json["admin"],
        analis: json["analis"] == null ? null : json["analis"],
        reviewer: json["reviewer"] == null ? null : json["reviewer"],
        pengutus: json["pengutus"] == null ? null : json["pengutus"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin == null ? null : admin,
        "analis": analis == null ? null : analis,
        "reviewer": reviewer == null ? null : reviewer,
        "pengutus": pengutus == null ? null : pengutus,
      };
}

class ProviderDatum {
  ProviderDatum({
    this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
    this.providerId,
  });

  String? uid;
  String? displayName;
  String? email;
  String? photoUrl;
  String? providerId;

  factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
        uid: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        photoUrl: json["photoURL"],
        providerId: json["providerId"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "email": email,
        "photoURL": photoUrl,
        "providerId": providerId,
      };
}
