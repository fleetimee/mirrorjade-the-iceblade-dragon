import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/data/model/auth/auth.mode.l.dart';

class AuthProvider {
  final httpClient = http.Client();

  Future<Auth> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}auth'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Auth.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Auth> verifyIdToken(String idToken) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}auth/verify'),
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin':
              '*', // Required for CORS support to work
        },
        body: {
          'token': idToken,
        },
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Auth.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
