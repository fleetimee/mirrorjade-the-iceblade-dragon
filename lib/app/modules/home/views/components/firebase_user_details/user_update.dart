import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';
import 'package:zanpakuto_ichigo/app/widget/users_detail.dart';

class FirebaseUpdate extends StatelessWidget {
  const FirebaseUpdate({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        GFButton(
          onPressed: () {
            Get.back();
          },
          text: 'Cancel',
          type: GFButtonType.outline2x,
          color: GFColors.DANGER,
          icon: const Icon(
            Icons.cancel,
            color: GFColors.DANGER,
          ),
        ),
        GFButton(
          onPressed: () {
            // controller.updateRemoteUser(
            //   controller.listRemoteUsers[index].uid!,
            //   controller.listRemoteUsers[index].email!,
            //   controller.listRemoteUsers[index].displayName!,
            // );
          },
          text: 'Update',
          type: GFButtonType.outline2x,
          color: GFColors.SUCCESS,
          icon: const Icon(
            Icons.check_outlined,
            color: GFColors.SUCCESS,
          ),
        ),
      ],
      title: const Text('Update User'),
      content: FormBuilder(
        autoFocusOnValidationFailure: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          UsersDetailFormEditable(
                            hint: 'Email',
                            initialValue:
                                controller.listRemoteUsers[index].email,
                            name: 'email_update',
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Display Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          UsersDetailFormEditable(
                            hint: 'Display Name',
                            initialValue:
                                controller.listRemoteUsers[index].displayName,
                            name: 'display_name_update',
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailFormEditable(
                  hint: 'Password',
                  validator: FormBuilderValidators.compose(
                    [
                      // Check weak password
                      (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return null;
                          }
                          if (value.length < 6) {
                            return null;
                          }
                          if (value.length >= 6) {
                            if (value.contains(RegExp(r'[A-Z]')) &&
                                value.contains(RegExp(r'[a-z]')) &&
                                value.contains(RegExp(r'[0-9]'))) {
                              return null;
                            } else {
                              return 'Password must contain at least one uppercase letter, one lowercase letter and one number';
                            }
                          }
                        }
                        return null;
                      }
                    ],
                  ),
                  initialValue: '',
                  name: 'password_update',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailFormEditable(
                  hint: 'Confirm Password',
                  initialValue: '',
                  validator: FormBuilderValidators.compose(
                    [
                      // Match password
                      (val) {
                        if (val !=
                            controller.formKey.currentState!
                                .fields['password_update']!.value) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ],
                  ),
                  name: 'confirm_password_update',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Verify Email',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormBuilderCheckbox(
                            name: 'verify_email_update',
                            initialValue:
                                controller.listRemoteUsers[index].emailVerified,
                            title: const Text('Verify this user email'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Disable User ?',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormBuilderCheckbox(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            name: 'disable_user_update',
                            initialValue:
                                controller.listRemoteUsers[index].disabled,
                            title: const Text('Disable this user'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
