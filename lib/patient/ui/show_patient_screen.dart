
import 'package:flutter/material.dart';
import 'package:hospital_mgt/database/database_helper.dart';
import 'package:hospital_mgt/patient/model/patient_model.dart';
import 'package:hospital_mgt/patient/ui/update_screen.dart';
import 'package:hospital_mgt/shared/route_map.dart';

class ShowPatientScreen extends StatefulWidget {
  const ShowPatientScreen({super.key});

  @override
  State<ShowPatientScreen> createState() => _ShowPatientScreenState();
}

class _ShowPatientScreenState extends State<ShowPatientScreen> {
  List<Patient> patientList = [];

  @override
  void initState() {
    getPatientData();
    super.initState();
  }

  Future getPatientData() async {
    patientList = await DatabaseHelper.getPatientData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ScreenName.showPatientScreen),
      ),
      body: patientList.isEmpty
          ? const Center(
              child: Text("No Patient data"),
            )
          : ListView.builder(
              itemCount: patientList.length,
              itemBuilder: (context, index) {
                Patient patientModel = patientList[index];

                return Dismissible(
                  key: Key('$index'),
                  confirmDismiss: (direction) async {
                    if (direction.name == 'endToStart') {
                      confirmDelete(patientModel.id);
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Id :',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 148,
                              ),
                              Text(
                                patientModel.id.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              IconButton(
                                onPressed: () async {
                                  confirmDelete(patientModel.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return UpdateScreen(patient: patientModel);
                                  }));
                                  getPatientData();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 108,
                              ),
                              Text(
                                patientModel.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Disease :',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 79,
                              ),
                              Text(
                                patientModel.disease,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Fees :',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 126,
                              ),
                              Text(
                                patientModel.fees.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Doctor :',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 122,
                              ),
                              Text(
                                patientModel.doctor,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Address :',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 122,
                              ),
                              Text(
                                patientModel.address,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void confirmDelete(int id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete Alert"),
            content: const Text("Are you sure to delete it ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    await deleteStudent(id);
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Delete")),
            ],
          );
        });
  }

  Future<void> deleteStudent(int id) async {
    await DatabaseHelper.deletePatient(id);
    await getPatientData();
  }
}
