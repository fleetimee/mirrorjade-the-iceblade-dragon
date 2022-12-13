import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/form/add_user.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/form/edit_user.dart';

class ManageLocalUsers extends StatelessWidget {
  ManageLocalUsers({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GFButton(
              onPressed: () {
                // Show dialog
                Get.dialog(
                  AddUserForm(controller: controller),
                );
              },
              text: 'Add User',
              icon: const Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GFStickyHeader(
            stickyContent: Container(
              alignment: AlignmentDirectional.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Avatar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Creation Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            content: const SizedBox.shrink(),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.listUsers.isEmpty) {
                  return const Center(
                    child: Text('No data'),
                  );
                } else {
                  if (controller.isUsersProcessing.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.listUsers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GFListTile(
                            avatar: CachedNetworkImage(
                              imageUrl: controller.listUsers[index].photoUrl!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            title: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    controller.listUsers[index].email
                                        .toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    controller.listUsers[index].displayName
                                        .toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(controller
                                          .listUsers[index].createdAt!)
                                      .toString(),
                                ),
                              ],
                            ),
                            icon: PopupMenuButton(
                              constraints: const BoxConstraints(
                                minWidth: 100,
                                maxWidth: 120,
                              ),
                              color: Colors.grey[200],
                              elevation: 10,
                              tooltip: 'More',
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: GFButton(
                                      onPressed: () {
                                        Get.dialog(
                                          EditUsersForm(
                                              controller: controller,
                                              // pass index to other screen
                                              index: index),
                                        );
                                        // )
                                      },
                                      text: 'Edit',
                                      type: GFButtonType.outline2x,
                                      color: GFColors.WARNING,
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: GFColors.WARNING,
                                      )),
                                ),
                                PopupMenuItem(
                                  child: GFButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: 'Delete',
                                          middleText:
                                              'Are you sure you want to delete this user?',
                                          textConfirm: 'Yes',
                                          textCancel: 'No',
                                          confirmTextColor: Colors.white,
                                          cancelTextColor:
                                              Theme.of(context).primaryColor,
                                          buttonColor:
                                              Theme.of(context).primaryColor,
                                          onConfirm: () {
                                            controller.trashUser(controller
                                                .listUsers[index].id!);
                                            Get.back();
                                          },
                                          onCancel: () {
                                            Get.back();
                                          },
                                        );
                                      },
                                      text: 'Delete',
                                      type: GFButtonType.outline2x,
                                      color: GFColors.DANGER,
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: GFColors.DANGER,
                                      )),
                                ),
                              ],
                            ));
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
