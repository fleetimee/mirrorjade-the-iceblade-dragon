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
          'Access-Control-Allow-Origin': '*'
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

  Future<void> addRoles(String id, Map<String, bool> body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}firebase-remote/$id/set-user-claims'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Access-Control-Allow-Origin':
              '*' // Required for CORS support to work
        },
        body: jsonEncode(body),
      );

      debugPrint(response.body);
      if (response.statusCode == 201) {
        return;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateUser(String id, Map<String, dynamic> body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}firebase-remote/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Access-Control-Allow-Origin':
              '*' // Required for CORS support to work
        },
        body: jsonEncode(body),
      );

      debugPrint(response.body);
      if (response.statusCode == 200) {
        return;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}firebase-remote/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Access-Control-Allow-Origin':
              '*' // Required for CORS support to work
        },
      );

      debugPrint(response.body);
      if (response.statusCode == 200) {
        return;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
