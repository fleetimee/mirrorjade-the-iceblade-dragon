import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/data/provider/auth/auth.provider.dart';
import 'package:zanpakuto_ichigo/app/routes/app_pages.dart';

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

  void _setInitialScreen(User? user) {
    if (user == null) {
      debugPrint("User is currently signed out!");
      Get.offAllNamed(Routes.AUTH);
    } else {
      debugPrint("User is signed in!");
      Get.offAllNamed(Routes.HOME);
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

        // Initialize Firebase with custom token to get idToken
        final idToken = await FirebaseAuth.instance
            .signInWithCustomToken(token!)
            .then((value) => value.user!.getIdToken());

        // Temporary print idToken
        debugPrint(idToken);

        // Get idToken from Firebase
        final idTokenFinal =
            await FirebaseAuth.instance.currentUser!.getIdToken();

        // Check if idToken has customClaims admin
        final claims =
            await FirebaseAuth.instance.currentUser!.getIdTokenResult();

        if (claims.claims!['admin'] == true) {
          debugPrint('Admin');
        } else {
          debugPrint('Not admin');
        }

        // Verify idToken with backend
        AuthProvider().verifyIdToken(idTokenFinal).then((resp) {
          if (resp.message == 'Token is valid') {
            // Get.offAllNamed(Routes.HOME);

            Get.snackbar(
              'Success',
              'Login successful',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              'Error',
              'Invalid access token',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        });
        isLoginProcessing(false);
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
}
