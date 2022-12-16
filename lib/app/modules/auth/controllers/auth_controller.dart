import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/data/provider/auth/auth.provider.dart';
import 'package:zanpakuto_ichigo/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    // firebaseUser = Rx<User?>(auth.currentUser);
    // ever(firebaseUser, handleAuth);
    // super.onReady();

    //

    // Check if platform is web

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) async {
    if (user == null) {
      debugPrint("User is currently signed out!");
      Get.offAllNamed(Routes.AUTH);
    } else {
      debugPrint("User is signed in!");
      // Check if idToken has customClaims admin
      final claims =
          await FirebaseAuth.instance.currentUser!.getIdTokenResult();

      if (claims.claims!['admin'] != true) {
        debugPrint('User is signed in, but not an admin');
        Get.dialog(
          AlertDialog(
            icon: const Icon(Icons.error),
            title: const Text('Error'),
            content: const Text(
                'Sorry, hanya admin yang bisa login ke aplikasi ini'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ).then((value) async {
          auth.signOut();

          final prefs = await SharedPreferences.getInstance();

          // remove all data from shared preferences
          prefs.clear();
        });
      } else {
        debugPrint('Logging in');
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  final formKey = GlobalKey<FormBuilderState>();

  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  final isLoginProcessing = false.obs;

  void login() {
    try {
      isLoginProcessing.value = true;
      AuthProvider().login(emailCtrl.text, passCtrl.text).then((resp) async {
        // Get custom token from login response
        final token = resp.accessToken;

        // save resp to shared preferences
        final prefs = await SharedPreferences.getInstance();

        // convert resp to string
        final encodedResp = jsonEncode(resp.data?.user);

        // save to shared preferences
        prefs.setString('loginResponse', encodedResp);

        // Initialize Firebase with custom token to get idToken
        final idToken = await FirebaseAuth.instance
            .signInWithCustomToken(token!)
            .then((value) {
          value.user!.getIdToken();
        }, onError: (error) {
          isLoginProcessing(false);
          FirebaseAuthException e = error as FirebaseAuthException;

          Get.dialog(
            AlertDialog(
              icon: const Icon(Icons.error),
              title: const Text('Error'),
              content: Text(e.message!),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        });

        // Temporary print idToken
        debugPrint(idToken);

        // Get idToken from Firebase
        // final idTokenFinal =
        //     await FirebaseAuth.instance.currentUser!.getIdToken();

        clearFormLogin();

        // Verify idToken with backend
        // AuthProvider().verifyIdToken(idTokenFinal).then((resp) {
        //   if (resp.message == 'Token is valid') {
        //     // Get.offAllNamed(Routes.HOME);
        //     debugPrint('Token is valid');
        //   } else {
        //     Get.snackbar(
        //       'Error',
        //       'Invalid access token',
        //       backgroundColor: Colors.red,
        //       colorText: Colors.white,
        //     );
        //   }
        // }, onError: (error) {
        //   isLoginProcessing(false);
        //   FirebaseAuthException e = error as FirebaseAuthException;

        //   Get.snackbar(
        //     'Error',
        //     e.message!,
        //     backgroundColor: Colors.red,
        //     colorText: Colors.white,
        //   );
        // });
      }, onError: (error) {
        isLoginProcessing(false);
        FirebaseAuthException e = error as FirebaseAuthException;

        Get.snackbar(
          'Error',
          e.message!,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isLoginProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearFormLogin() {
    emailCtrl.clear();
    passCtrl.clear();

    formKey.currentState!.reset();
  }
}
