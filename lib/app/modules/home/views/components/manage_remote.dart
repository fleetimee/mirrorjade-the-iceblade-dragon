import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/firebase_user_details/user_details.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/firebase_user_details/user_roles_update.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/firebase_user_details/user_update.dart';

class ManageRemoteUsers extends StatelessWidget {
  ManageRemoteUsers({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GFTypography(
            text: 'Manage Remote Users',
            type: GFTypographyType.typo1,
            icon: Icon(
              Icons.cloud_outlined,
              color: Colors.white,
            ),
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
            ),
            showDivider: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Akun dibawah ini terhubung langsung dengan Google (Firebase), disini admin dapat melihat detail akun secara langsung mulai dari kapan terakhir login dan sebagainya. Admin juga dapat mengubah role akun dan mendisable akun supaya tidak bisa login.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'Tidak melihat akunmu di bawah? Logout kemudian login menggunakan akun yang baru saja dibuat nanti akan ada notice jika akun tersebut bukan admin, kemudian login lagi dengan akun admin',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GFButton(
              onPressed: () {
                controller.refreshRemote();
              },
              text: 'Refresh',
              icon: const Icon(
                Icons.refresh,
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
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'UUID',
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
            child: Obx(() {
              if (controller.listRemoteUsers.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                if (controller.isRemoteUsersProcessing.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.listRemoteUsers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GFListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                controller.listRemoteUsers[index].uid!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                controller.listRemoteUsers[index].email ??
                                    'Unregistered',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                controller.listRemoteUsers[index].displayName ??
                                    'Unregistered',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                controller.listRemoteUsers[index].metadata
                                        ?.creationTime ??
                                    'Unregistered',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        subTitle:
                            // This will be user roles list
                            RolesCard(
                          controller: controller,
                          index: index,
                        ),
                        icon: PopupMenuButton(
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            maxWidth: 130,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'detail',
                                child: GFButton(
                                  text: 'Detail',
                                  type: GFButtonType.outline2x,
                                  color: GFColors.SUCCESS,
                                  icon: const Icon(
                                    Icons.info,
                                    color: GFColors.SUCCESS,
                                  ),
                                  onPressed: () {
                                    Get.dialog(
                                      // barrierDismissible: false,
                                      FirebaseDetails(
                                        controller: controller,
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              PopupMenuItem(
                                value: 'edit',
                                child: GFButton(
                                  text: 'Update',
                                  type: GFButtonType.outline2x,
                                  color: Colors.orange,
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () {
                                    Get.dialog(
                                      FirebaseUpdate(
                                        controller: controller,
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              PopupMenuItem(
                                value: 'role',
                                child: GFButton(
                                  onPressed: () {
                                    Get.dialog(
                                      RoleForm(
                                        controller: controller,
                                        index: index,
                                      ),
                                    );
                                  },
                                  text: 'Role',
                                  type: GFButtonType.outline2x,
                                  color: GFColors.INFO,
                                  icon: const Icon(
                                    Icons.person,
                                    color: GFColors.INFO,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: GFButton(
                                  text: 'Delete',
                                  type: GFButtonType.outline2x,
                                  color: GFColors.DANGER,
                                  icon: const Icon(
                                    Icons.delete,
                                    color: GFColors.DANGER,
                                  ),
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
                                        controller.deleteRemoteUser(controller
                                            .listRemoteUsers[index].uid!);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ];
                          },
                        ),
                      );
                    },
                  );
                }
              }
            }),
          )
        ],
      ),
    );
  }
}
