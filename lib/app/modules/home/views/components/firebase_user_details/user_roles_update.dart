import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';

class RoleForm extends StatelessWidget {
  const RoleForm({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Roles'),
      content: FormBuilder(
          key: controller.formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Obx(
              () {
                if (controller.isRemoteUsersProcessing.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Akun admin digunakan untuk memanage user lainnya',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      FormBuilderCheckbox(
                        name: 'admin',
                        title: const Text('Admin'),
                        initialValue: controller
                                .listRemoteUsers[index].customClaims?.admin ??
                            false,
                      ),
                      Text(
                        'Akun analis digunakan untuk melakukan input data di lapangan',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      FormBuilderCheckbox(
                        name: 'analis',
                        title: const Text('Analis'),
                        initialValue: controller
                                .listRemoteUsers[index].customClaims?.analis ??
                            false,
                      ),
                      Text(
                        'Akun reviewer digunakan untuk melakukan review data yang telah diinput oleh analis',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      FormBuilderCheckbox(
                        name: 'reviewer',
                        title: const Text('Reviewer'),
                        initialValue: controller.listRemoteUsers[index]
                                .customClaims?.reviewer ??
                            false,
                      ),
                      Text(
                        'Akun pengutus digunakan untuk mengutus data yang telah direview oleh reviewer',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      FormBuilderCheckbox(
                        name: 'pengutus',
                        title: const Text('Pemutus'),
                        initialValue: controller.listRemoteUsers[index]
                                .customClaims?.pengutus ??
                            false,
                      ),
                    ],
                  );
                }
              },
            ),
          )),
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
            if (controller.formKey.currentState?.saveAndValidate() ?? false) {
              controller.applyRole(
                controller.listRemoteUsers[index].uid!,
              );
            }
          },
          text: 'Update',
          type: GFButtonType.outline2x,
          color: GFColors.SUCCESS,
          icon: const Icon(
            Icons.update,
            color: GFColors.SUCCESS,
          ),
        ),
      ],
    );
  }
}

class RolesCard extends StatelessWidget {
  const RolesCard({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 65,
        ),
        Text(
          'Roles: ',
          style: Theme.of(context).textTheme.subtitle2?.merge(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        // Admin Check
        controller.listRemoteUsers[index].customClaims?.admin == true
            ? SizedBox(
                width: 80,
                child: Card(
                  color: GFColors.DANGER,
                  elevation: 10,
                  child: Column(
                    children: [
                      controller.listRemoteUsers[index].customClaims?.admin ==
                              true
                          ? const Text(
                              'Admin',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),

        // Analis Check
        controller.listRemoteUsers[index].customClaims?.analis == true
            ? SizedBox(
                width: 80,
                child: Card(
                  elevation: 10,
                  color: GFColors.INFO,
                  child: Column(
                    children: [
                      controller.listRemoteUsers[index].customClaims?.analis ==
                              true
                          ? const SizedBox(
                              width: 5,
                            )
                          : const SizedBox.shrink(),
                      controller.listRemoteUsers[index].customClaims?.analis ==
                              true
                          ? const Text(
                              'Analis',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),

        // Reviewer Check
        controller.listRemoteUsers[index].customClaims?.reviewer == true
            ? SizedBox(
                width: 100,
                child: Card(
                  elevation: 10,
                  color: GFColors.SUCCESS,
                  child: Column(
                    children: [
                      controller.listRemoteUsers[index].customClaims
                                  ?.reviewer ==
                              true
                          ? const SizedBox(
                              width: 5,
                            )
                          : const SizedBox.shrink(),
                      controller.listRemoteUsers[index].customClaims
                                  ?.reviewer ==
                              true
                          ? const Text(
                              'Reviewer',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),

        // Pengutus Check
        controller.listRemoteUsers[index].customClaims?.pengutus == true
            ? SizedBox(
                width: 100,
                child: Card(
                  elevation: 10,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      controller.listRemoteUsers[index].customClaims
                                  ?.pengutus ==
                              true
                          ? const SizedBox(
                              width: 5,
                            )
                          : const SizedBox.shrink(),
                      controller.listRemoteUsers[index].customClaims
                                  ?.pengutus ==
                              true
                          ? const Text(
                              'Pemutus',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
