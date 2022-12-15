import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';
import 'package:zanpakuto_ichigo/app/widget/users_detail.dart';

class FirebaseDetails extends StatelessWidget {
  const FirebaseDetails({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;

  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // show user detail
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Detail ${controller.listRemoteUsers[index].displayName ?? 'Unregistered'}',
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      content: FormBuilder(
        key: controller.formKey,
        child: SizedBox(
          width: 500,
          height: 800,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 75,
                    child: CachedNetworkImage(
                      imageUrl: controller.listRemoteUsers[index].photoUrl !=
                              null
                          ? controller.listRemoteUsers[index].photoUrl!
                          : controller.listRemoteUsers[index].providerData!
                                      .isEmpty ||
                                  controller.listRemoteUsers[index]
                                          .providerData![0].photoUrl ==
                                      null
                              ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                              : controller.listRemoteUsers[index]
                                  .providerData![0].photoUrl!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatusBar(
                  controller: controller,
                  index: index,
                ),
                const SizedBox(
                  height: 15,
                ),
                Roles(
                  controller: controller,
                  index: index,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  ctrl: controller.emailRemote = TextEditingController(
                    text: controller.listRemoteUsers[index].email ?? '',
                  ),
                  hint: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  name: 'email_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Display Name',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  ctrl: controller.displayNameRemote = TextEditingController(
                    text: controller.listRemoteUsers[index].displayName ?? '',
                  ),
                  hint: 'Name',
                  prefixIcon: const Icon(Icons.alternate_email_outlined),
                  name: 'name_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'UUID',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  initialValue: controller.listRemoteUsers[index].uid,
                  hint: 'UUID',
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  name: 'uuid_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const UsersDetailForm(
                  initialValue: 'Not Registered',
                  hint: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  name: 'phone_number_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Last Login',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  initialValue: controller
                      .listRemoteUsers[index].metadata?.lastSignInTime,
                  hint: 'Last Login',
                  prefixIcon: const Icon(Icons.login_outlined),
                  name: 'last_login_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Created At',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  initialValue:
                      controller.listRemoteUsers[index].metadata?.creationTime,
                  hint: 'Created At',
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  name: 'created_at_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Last Refresh',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  initialValue: controller
                      .listRemoteUsers[index].metadata?.lastRefreshTime,
                  hint: 'Last Refresh',
                  prefixIcon: const Icon(Icons.refresh_outlined),
                  name: 'last_refresh_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Token expire at',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UsersDetailForm(
                  initialValue:
                      controller.listRemoteUsers[index].tokensValidAfterTime,
                  hint: 'Token expire at',
                  prefixIcon: const Icon(Icons.refresh_outlined),
                  name: 'token_expire_at_remote',
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // check if email is verified
        controller.listRemoteUsers[index].emailVerified == true
            ? Row(
                children: const [
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Email is verified',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            : Row(
                children: const [
                  Icon(
                    Icons.close_sharp,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Email is not verified',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

        const SizedBox(
          width: 20,
        ),

        // chek if user is disabled
        controller.listRemoteUsers[index].disabled == true
            ? Row(
                children: const [
                  Icon(
                    Icons.close_sharp,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'User is disabled',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            : Row(
                children: const [
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'User is enabled',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

class Roles extends StatelessWidget {
  const Roles({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // if customClaims equals admin == true
        // show admin icon
        controller.listRemoteUsers[index].customClaims?.admin == true
            ? Row(
                children: const [
                  Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            : const SizedBox(),

        const SizedBox(
          width: 10,
        ),

        // if customClaims equals analis == true
        // show analis icon
        controller.listRemoteUsers[index].customClaims?.analis == true
            ? Row(
                children: const [
                  Icon(
                    Icons.analytics_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Analis',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            : const SizedBox(),

        const SizedBox(
          width: 10,
        ),

        // if customClaims equals reviewer == true
        // show reviewer icon
        controller.listRemoteUsers[index].customClaims?.reviewer == true
            ? Row(
                children: const [
                  Icon(
                    Icons.verified_user_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Reviewer',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            : const SizedBox(),

        const SizedBox(
          width: 10,
        ),

        // if customClaims equels pemutus == true
        // show pemutus icon
        controller.listRemoteUsers[index].customClaims?.pengutus == true
            ? Row(
                children: const [
                  Icon(
                    Icons.sentiment_very_satisfied_outlined,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Pemutus',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
