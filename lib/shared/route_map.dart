import 'package:flutter/material.dart';
import 'package:hospital_mgt/doctor/ui/add_doctor_screen.dart';
import 'package:hospital_mgt/patient/ui/add_patient_screen.dart';

Map<String, WidgetBuilder> routeMap = {
  ScreenName.addDoctorScreen: (context) {
    return const AddDoctorScreen();
  },
  ScreenName.addPatientScreen: (context) {
    return const AddPatientScreen();
  }
};

class ScreenName {
  static const String addDoctorScreen = "AddDoctorScreen";
  static const String addPatientScreen = "AddPatientScreen";
}
