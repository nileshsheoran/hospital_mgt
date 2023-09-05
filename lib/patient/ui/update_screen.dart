import 'package:flutter/material.dart';
import 'package:hospital_mgt/database/database_helper.dart';
import 'package:hospital_mgt/patient/model/patient_model.dart';
import 'package:hospital_mgt/shared/string_const.dart';

class UpdatePatientScreen extends StatefulWidget {
  const UpdatePatientScreen({required this.patient, super.key});

  final Patient patient;

  @override
  State<UpdatePatientScreen> createState() => _UpdatePatientScreenState();
}

class _UpdatePatientScreenState extends State<UpdatePatientScreen> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController diseaseController;
  late TextEditingController feesController;
  late TextEditingController doctorController;
  late TextEditingController addressController;

  @override
  void initState() {
    Patient patient = widget.patient;

    idController = TextEditingController(text: patient.id.toString());
    nameController = TextEditingController(text: patient.name);
    diseaseController = TextEditingController(text: patient.disease);
    feesController = TextEditingController(text: patient.fees.toString());
    doctorController = TextEditingController(text: patient.doctor);
    addressController = TextEditingController(text: patient.address);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConst.updatePatientScreen,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Id'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Name',
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
                  labelText: 'Disease',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: feesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Fees',
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
                  labelText: 'Doctor',
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
                  labelText: 'Address',
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
                    await DatabaseHelper.updatePatient(patient);
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Update',
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
