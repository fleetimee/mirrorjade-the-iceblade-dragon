import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/data/model/firebase-user/firebase-user.model.dart';

class UsersFirebaseProvider {
  final httpClient = http.Client();

  Future<FirebaseUsers> fetchRemoteUsers() async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}firebase-remote'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
        },
      );
      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body);
        // debugPrint(data.toString());
        // return (data as List).map((e) => User.fromJson(e)).toList();
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return FirebaseUsers.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
