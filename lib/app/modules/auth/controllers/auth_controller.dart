import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();
}
