import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

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
          children: const [RecentRegistered(), SizedBox(height: 10), LoginAs()],
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
