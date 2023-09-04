import 'package:flutter/material.dart';
import 'package:hospital_mgt/database/database_helper.dart';
import 'package:hospital_mgt/patient/model/patient_model.dart';
import 'package:hospital_mgt/shared/route_map.dart';
import 'package:hospital_mgt/shared/string_const.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController diseaseController;
  late TextEditingController feesController;
  late TextEditingController doctorController;
  late TextEditingController addressController;

  @override
  void initState() {
    idController = TextEditingController();
    nameController = TextEditingController();
    diseaseController = TextEditingController();
    feesController = TextEditingController();
    doctorController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ScreenName.addPatientScreen),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText1,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText2,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: diseaseController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText3,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: feesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText4,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText5,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: StringConst.labelText6,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    Patient patient = Patient(
                      id: int.parse(idController.text),
                      name: nameController.text,
                      disease: diseaseController.text,
                      fees: int.parse(feesController.text),
                      doctor: doctorController.text,
                      address: addressController.text,
                    );
                    await DatabaseHelper.addPatientData(patient);
                    if (mounted) {
                      Navigator.pop(context);
                    }
                    allClear();
                  },
                  child: const Text(
                    StringConst.buttonText,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void allClear() {
    idController.clear();
    nameController.clear();
    diseaseController.clear();
    feesController.clear();
    doctorController.clear();
    addressController.clear();
  }
}
