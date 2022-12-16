import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';

class EditUsersForm extends StatelessWidget {
  const EditUsersForm({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;

  // get index from other screen
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit User'),
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
                        name: 'email_edit',
                        initialValue: controller.listUsers[index].email,
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
                        name: 'displayName_edit',
                        initialValue: controller.listUsers[index].displayName,
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
                        name: 'phoneNumber_edit',
                        keyboardType: TextInputType.phone,
                        initialValue:
                            controller.listUsers[index].phoneNumber ?? '',
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
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Obx(
              //     () {
              //       return GFButton(
              //         onPressed: controller.isUsersProcessing.value
              //             ? null
              //             : () {
              //                 if (controller.formKey.currentState!
              //                     .saveAndValidate()) {
              //                   controller.modifyUser(
              //                       controller.listUsers[index].id!);
              //                 }
              //                 Get.back();
              //               },
              //         text: 'Update User',
              //         shape: GFButtonShape.pills,
              //         color: Theme.of(context).primaryColor,
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
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
        Obx(() {
          return GFButton(
            onPressed: controller.isUsersProcessing.value
                ? null
                : () {
                    if (controller.formKey.currentState!.saveAndValidate()) {
                      controller.modifyUser(controller.listUsers[index].id!);
                    }
                    Get.back();
                  },
            type: GFButtonType.outline2x,
            icon: const Icon(
              Icons.check_outlined,
              color: GFColors.SUCCESS,
            ),
            text: 'Update',
            color: GFColors.SUCCESS,
          );
        })
      ],
    );
  }
}
