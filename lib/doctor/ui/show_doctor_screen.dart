import 'package:flutter/material.dart';
import 'package:hospital_mgt/database/database_helper.dart';

import '../model/doctor_model.dart';

class ShowDoctorScreen extends StatefulWidget {
  const ShowDoctorScreen({super.key});

  @override
  State<ShowDoctorScreen> createState() => _ShowDoctorScreenState();
}

class _ShowDoctorScreenState extends State<ShowDoctorScreen> {
  List<Doctor>doctorList=[];
  @override
  @override
  void initState() {
    showDoctorData();
    super.initState();
  }

  Future showDoctorData() async {
    doctorList = await DatabaseHelper.getDoctorData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text(''),),
      body: ListView.builder(
          itemCount: doctorList.length,
          itemBuilder:(context,index){
        Doctor doctor=doctorList[index];
        return Column(
          children: [
            Row(
              children: [
                const Text('id'),
                const SizedBox(width: 100,),
                Text(doctor.id.toString()),
              ],
            ),
            Row(
              children: [
                const Text('Name'),
                const SizedBox(width: 100,),
                Text(doctor.name),
              ],
            ),
            Row(
              children: [
                const Text('Specialist'),
                const SizedBox(width: 100,),
                Text(doctor.specialist),
              ],
            ),
            Row(
              children: [
                const Text('Fees'),
                const SizedBox(width: 100,),
                Text(doctor.fees.toString()),
              ],
            ),
            Row(
              children: [
                const Text('Timing'),
                const SizedBox(width: 100,),
                Text(doctor.timing.toString()),
              ],
            ),
          ],
        );
      }),
    ));
  }
}
