import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:zanpakuto_ichigo/app/data/model/firebase-user/firebase-user.model.dart';
import 'package:zanpakuto_ichigo/app/data/model/user/user.model.dart';
import 'package:zanpakuto_ichigo/app/data/provider/user-remote/user-remote.provider.dart';
import 'package:zanpakuto_ichigo/app/data/provider/user/user.provider.dart';

class HomeController extends GetxController {
  // formKey
  final formKey = GlobalKey<FormBuilderState>();

  // for fetching list of users
  var listUsers = List<Users>.empty(growable: true).obs;
  var isUsersProcessing = false.obs;
  var listRemoteUsers = List<User>.empty(growable: true).obs;
  var isRemoteUsersProcessing = false.obs;

  // for local form variable
  var email = TextEditingController();
  var password = TextEditingController();
  var displayName = TextEditingController();
  var phoneNumber = TextEditingController();

  // for remote form variable
  var emailRemote = TextEditingController();
  var passwordRemote = TextEditingController();
  var displayNameRemote = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUsers();
    getRemoteUsers();
  }

  void getUsers() {
    try {
      isUsersProcessing(true);
      UsersProvider().fetchUsers().then((resp) {
        isUsersProcessing(false);
        listUsers.clear();
        listUsers.addAll(resp);
      }, onError: (e) {
        isUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deployUser() {
    final body = {
      'email': email.text,
      'password': password.text,
      'displayName': displayName.text,
      'phoneNumber': phoneNumber.text,
    };

    try {
      isUsersProcessing(true);
      UsersProvider().addUsers(body).then((resp) {
        isUsersProcessing(false);
        clearForm();
        getUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User added successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void modifyUser(String id) {
    final body = {
      'email': formKey.currentState?.fields['email_edit']?.value,
      'displayName': formKey.currentState?.fields['displayName_edit']?.value,
      'phoneNumber': formKey.currentState?.fields['phoneNumber_edit']?.value,
    };

    try {
      isUsersProcessing(true);
      UsersProvider().editUsers(id, body).then((resp) {
        isUsersProcessing(false);
        clearForm();
        getUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User updated successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void trashUser(String id) {
    try {
      isUsersProcessing(true);
      UsersProvider().deleteUsers(id).then((resp) {
        isUsersProcessing(false);
        clearForm();
        getUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User deleted successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void getRemoteUsers() async {
    try {
      isRemoteUsersProcessing(true);
      // UsersFirebaseProvider().fetchRemoteUsers().then((resp) {
      //   isRemoteUsersProcessing(false);
      //   listRemoteUsers.clear();
      //   // listRemoteUsers.addAll(resp);
      // }, onError: (e) {
      //   isRemoteUsersProcessing(false);
      //   Get.snackbar('Error', e.toString());
      // });

      UsersFirebaseProvider().fetchRemoteUsers().then((resp) {
        isRemoteUsersProcessing(false);
        final listResult = resp.data?.users;
        listRemoteUsers.clear();
        listRemoteUsers.addAll(listResult!);
      }, onError: (error) {
        isRemoteUsersProcessing(false);
        Get.snackbar('Error', error.toString());
      });

      // final result = await UsersFirebaseProvider().fetchRemoteUsers();
      // final listResult = result.data?.users;
      // listRemoteUsers.clear();
      // listRemoteUsers.addAll(listResult!);
    } catch (e) {
      isRemoteUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void applyRole(String id) {
    final Map<String, bool> body = {
      'admin': formKey.currentState?.fields['admin']?.value,
      'analis': formKey.currentState?.fields['analis']?.value,
      'reviewer': formKey.currentState?.fields['reviewer']?.value,
      'pengutus': formKey.currentState?.fields['pengutus']?.value,
    };

    try {
      isRemoteUsersProcessing(true);
      UsersFirebaseProvider().addRoles(id, body).then((resp) {
        isRemoteUsersProcessing(false);
        clearForm();
        getRemoteUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User updated successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isRemoteUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isRemoteUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void updateRemoteUser(String id) {
    final body = {
      'email': formKey.currentState?.fields['emailRemoteUpdate']?.value,
      'displayName':
          formKey.currentState?.fields['displayNameRemoteUpdate']?.value,
      'password':
          formKey.currentState?.fields['confirmPasswordRemoteUpdate']?.value,
      'disabled':
          formKey.currentState?.fields['disableUserRemoteUpdate']?.value,
      'emailVerified':
          formKey.currentState?.fields['verifyEmailRemoteUpdate']?.value,
    };

    try {
      isRemoteUsersProcessing(true);
      UsersFirebaseProvider().updateUser(id, body).then((resp) {
        isRemoteUsersProcessing(false);
        clearForm();
        getRemoteUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User updated successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isRemoteUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isRemoteUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteRemoteUser(String id) {
    try {
      isRemoteUsersProcessing(true);
      UsersFirebaseProvider().deleteUser(id).then((resp) {
        isRemoteUsersProcessing(false);
        clearForm();
        getRemoteUsers();
        Get.back();
        Get.snackbar(
          'Success',
          'User deleted successfully',
          backgroundColor: GFColors.SUCCESS,
          colorText: GFColors.WHITE,
          icon: const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: GFColors.WHITE,
          ),
        );
      }, onError: (e) {
        isRemoteUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isRemoteUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void refreshLocal() {
    getUsers();
  }

  void refreshRemote() {
    getRemoteUsers();
  }

  void clearForm() {
    email.clear();
    password.clear();
    displayName.clear();
    phoneNumber.clear();

    formKey.currentState?.reset();
  }
}
