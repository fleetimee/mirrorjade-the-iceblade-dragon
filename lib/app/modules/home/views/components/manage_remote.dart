import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';

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
                        title: Text(controller.listRemoteUsers[index].uid!),
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
