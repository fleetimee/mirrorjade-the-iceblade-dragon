// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/data/model/user/user.model.dart';

class UsersProvider {
  final httpClient = http.Client();

  Future<List<Users>> fetchUsers() async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}users'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => Users.fromJson(e)).toList();
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Users> addUsers(body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}users'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
        },
        body: jsonEncode(body),
      );

      debugPrint(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return Users.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> editUsers(String id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}users/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
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

  Future<void> deleteUsers(String id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}users/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
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
