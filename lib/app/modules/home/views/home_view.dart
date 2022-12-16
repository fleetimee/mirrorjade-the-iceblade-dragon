import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/dashboard.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/manage_local.dart';
import 'package:zanpakuto_ichigo/app/modules/home/views/components/manage_remote.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  PageController page = PageController();

  // Check if it dark mode or not
  bool isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            showToggle: true,
            displayModeToggleDuration: const Duration(milliseconds: 500),
            // Page controller to manage a PageView
            controller: page,
            style: SideMenuStyle(
              selectedIconColor: isDarkMode ? Colors.white : Colors.black,
              unselectedIconColor: isDarkMode ? Colors.white : Colors.black,
              selectedTitleTextStyle: isDarkMode
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              unselectedTitleTextStyle: isDarkMode
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
            ),
            // Will shows on top of all items, it can be a logo or a Title text
            title: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/anya.png',
                  fit: BoxFit.cover,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            footer: Text(
              'Crafted with ❤️ in Yogyakarta',
              style: Theme.of(context).textTheme.caption,
            ),

            // Notify when display mode changed
            onDisplayModeChanged: (mode) {
              // Collapse SideMenu when displayMode was SideMenuDisplayMode.closed
              if (mode == SideMenuDisplayMode.open) {}
            },
            // List of SideMenuItem to show them on SideMenu
            items: [
              SideMenuItem(
                // Priority of item to show on SideMenu, lower value is displayed at the top
                priority: 0,
                title: 'Dashboard',
                onTap: () => page.jumpToPage(0),
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Manage User (Local)',
                onTap: () => page.jumpToPage(1),
                icon: const Icon(Icons.person_pin_rounded),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Manage User (Remote)',
                onTap: () => page.jumpToPage(2),
                icon: const Icon(Icons.cloud),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Exit',
                onTap: () {
                  // logout firebase
                  auth.signOut();
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: page,
              children: [
                const Dashboard(),
                ManageLocalUsers(),
                ManageRemoteUsers()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
