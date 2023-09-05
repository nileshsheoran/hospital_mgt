import 'package:flutter/material.dart';
import 'package:hospital_mgt/dashboard/ui/dashboard_screen.dart';
import 'package:hospital_mgt/database/database_helper.dart';
import 'package:hospital_mgt/shared/route_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: routeMap,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
