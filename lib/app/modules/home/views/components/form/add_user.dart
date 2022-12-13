import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';

class AddUserForm extends StatelessWidget {
  const AddUserForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Add User'),
      content: FormBuilder(
        key: controller.formKey,
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                if (controller.isUsersProcessing.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        controller: controller.email,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'password',
                        controller: controller.password,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'displayName',
                        controller: controller.displayName,
                        decoration: const InputDecoration(
                          labelText: 'Display Name',
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'phoneNumber',
                        controller: controller.phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }
              }),
              Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.saveAndValidate()) {
                      controller.deployUser();
                    }
                  },
                  text: 'Add User',
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
