import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:zanpakuto_ichigo/app/modules/home/controllers/home_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
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
          children: [
            RecentRegistered(),
            const SizedBox(height: 10),
            LoginAs(),
          ],
        ),
      ],
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
  LoginAs({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

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
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Obx(() {
                  return CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: controller.photoUrlLogged.value,
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Obx(() {
                return Text(
                  controller.displayNameLogged.value,
                  style: Theme.of(context).textTheme.headline6?.merge(
                        const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentRegistered extends StatelessWidget {
  RecentRegistered({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

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
            Expanded(child: Obx(() {
              if (controller.isUsersProcessing.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.listUsers.length > 5
                      ? 5
                      : controller.listUsers.length,
                  itemBuilder: (context, index) {
                    return GFListTile(
                      selected: true,
                      avatar: CircleAvatar(
                        child: CachedNetworkImage(
                          imageUrl: controller.listUsers[index].photoUrl ??
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      title: Text(
                        controller.listUsers[index].displayName!,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      // Date Subtitle
                      subTitle: Text(
                        DateFormat('dd/MM/yy')
                            .format(controller.listUsers[index].createdAt!),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  },
                );
              }
            })),
          ],
        ),
      ),
    );
  }
}
