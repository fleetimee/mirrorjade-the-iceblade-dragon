import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/firebase_user_details/user_details.dart';

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
        children: [
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
                              width: 135,
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
                            Row(
                          children: [
                            const SizedBox(
                              width: 65,
                            ),
                            Text(
                              'Roles: ',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            controller.listRemoteUsers[index].customClaims
                                        ?.admin ==
                                    true
                                ? const Text(
                                    'Admin',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              width: 5,
                            ),
                            controller.listRemoteUsers[index].customClaims
                                        ?.analis ==
                                    true
                                ? const Text(
                                    'Analis',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        icon: GFIconButton(
                          icon: const Icon(Icons.feed_outlined),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Get.dialog(
                              FirebaseDetails(
                                controller: controller,
                                index: index,
                              ),
                            );
                          },
                          size: GFSize.SMALL,
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
