import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/widget/auth_form.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/images/anya.png',
                width: 200,
              ),
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: AuthForm(
                  prefixIcon: const Icon(Icons.email),
                  name: 'email',
                  ctrl: controller.emailCtrl,
                  hint: 'Masukkan email anda',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: AuthForm(
                  prefixIcon: const Icon(Icons.lock),
                  name: 'password',
                  ctrl: controller.passCtrl,
                  hint: 'Password',
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => GFButton(
                      onPressed: () {
                        if (controller.formKey.currentState
                                ?.saveAndValidate() ??
                            false) {
                          controller.login();
                        } else {
                          debugPrint('Form is invalid');
                        }
                      },
                      text: controller.isLoginProcessing.value
                          ? 'Loading...'
                          : 'Login',
                      fullWidthButton: true,
                      color: Theme.of(context).primaryColor,
                      size: GFSize.LARGE,
                      shape: GFButtonShape.pills,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
