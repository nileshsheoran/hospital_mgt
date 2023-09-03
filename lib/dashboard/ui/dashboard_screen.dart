import 'package:flutter/material.dart';
import 'package:hospital_mgt/shared/route_map.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.addDoctorScreen);
            },
            child: const Text('Add Doctor'),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.showDoctorScreen);
            },
            child: const Text('Show Doctors'),
          ),
        ],
      ),
    ));
  }
}
