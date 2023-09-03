import 'package:flutter/material.dart';
import 'package:hospital_mgt/doctor/ui/add_doctor_screen.dart';
import 'package:hospital_mgt/doctor/ui/show_doctor_screen.dart';


Map<String, WidgetBuilder> routeMap = {
  ScreenName.addDoctorScreen: (context) {
    return const AddDoctorScreen();
  },
  ScreenName.showDoctorScreen: (context) {
    return const ShowDoctorScreen();
  }
};

class ScreenName {
  static const String addDoctorScreen = "AddDoctorScreen";
  static const String showDoctorScreen = "ShowDoctorScreen";
}
