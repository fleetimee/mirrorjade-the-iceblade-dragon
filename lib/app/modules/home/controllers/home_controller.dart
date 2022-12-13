import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:zanpakuto_ichigo/app/data/model/user/user.model.dart';
import 'package:zanpakuto_ichigo/app/data/provider/user/user.provider.dart';

class HomeController extends GetxController {
  // formKey
  final formKey = GlobalKey<FormBuilderState>();

  // for fetching list of users
  var listUsers = List<Users>.empty().obs;
  var isUsersProcessing = false.obs;

  // for local form variable
  var email = TextEditingController();
  var password = TextEditingController();
  var displayName = TextEditingController();
  var phoneNumber = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUsers();
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

  void clearForm() {
    email.clear();
    password.clear();
    displayName.clear();
    phoneNumber.clear();

    formKey.currentState?.reset();
  }
}
