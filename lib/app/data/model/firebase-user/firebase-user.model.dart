// To parse this JSON data, do
//
//     final firebaseUsers = firebaseUsersFromJson(jsonString);

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
    this.metadata,
    this.providerData,
    this.email,
    this.displayName,
    this.tokensValidAfterTime,
  });

  String? uid;
  bool? emailVerified;
  bool? disabled;
  Metadata? metadata;
  List<ProviderDatum>? providerData;
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
        providerData: json["providerData"] == null
            ? null
            : List<ProviderDatum>.from(
                json["providerData"].map((x) => ProviderDatum.fromJson(x))),
        email: json["email"],
        displayName: json["displayName"],
        tokensValidAfterTime: json["tokensValidAfterTime"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "emailVerified": emailVerified,
        "disabled": disabled,
        "metadata": metadata == null ? null : metadata?.toJson(),
        "providerData": providerData == null
            ? null
            : List<dynamic>.from(providerData!.map((x) => x.toJson())),
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
