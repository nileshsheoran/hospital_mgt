import 'package:flutter/material.dart';
import 'package:hospital_mgt/shared/route_map.dart';
import 'package:hospital_mgt/patient/ui/add_patient_screen.dart';
import 'package:hospital_mgt/patient/ui/show_patient_screen.dart';
import 'package:hospital_mgt/shared/route_map.dart';
import 'package:hospital_mgt/shared/string_const.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConst.dashboardScreenText,
        ),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenName.addPatientScreen);
                  },
                  child: const Text(
                    'Add Patient',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenName.showPatientScreen);
                  },
                  child: const Text(
                    'Show Patient',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
