import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: const Icon(Icons.person_outline_rounded),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Exit',
                onTap: () {},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: page,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome to the main menu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Please select an option from the menu',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const StatusTracker(),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: false,
                          child: SizedBox(
                            height: 100,
                            width: 300,
                            child: Card(
                              child: PieChart(
                                PieChartData(
                                    // read about it in the PieChartData section
                                    ),
                                swapAnimationDuration: const Duration(
                                    milliseconds: 150), // Optional
                                swapAnimationCurve: Curves.linear, // Optional
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        RecentRegistered(),
                        SizedBox(height: 10),
                        LoginAs()
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GFButton(
                          onPressed: () {},
                          text: 'Add User',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GFStickyHeader(
                          stickyContent: Container(
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              color: Theme.of(context).primaryColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    width: 200,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    'Name',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          content: const SizedBox.shrink()),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GFListTile(
                                  avatar: const GFAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/anya.png'),
                                  ),
                                  title: Row(
                                    children: const [
                                      SizedBox(
                                        width: 250,
                                        child:
                                            Text('Novian Andika Novian Andika'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Name'),
                                    ],
                                  ),
                                  icon: const Icon(Icons.person),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusTracker extends StatelessWidget {
  const StatusTracker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 150,
              width: 200,
              child: Card(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.handshake_outlined,
                      size: 50,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Diterima',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 150,
              width: 200,
              child: Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.pending_outlined,
                      size: 50,
                      color: Colors.orange[800],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '5',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              height: 150,
              width: 200,
              child: Card(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.cancel_outlined,
                      size: 50,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ditolak',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 150,
              width: 200,
              child: Card(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      size: 50,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Selesai',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}

class LoginAs extends StatelessWidget {
  const LoginAs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Logged in as',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Anya',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentRegistered extends StatelessWidget {
  const RecentRegistered({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently Registered',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GFListTile(
                    selected: true,
                    avatar: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/anya.png',
                      ),
                    ),
                    title: Text(
                      'Anya',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    // Date Subtitle
                    subTitle: Text(
                      '12/12/2021',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
