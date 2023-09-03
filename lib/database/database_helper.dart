import 'package:hospital_mgt/patient/model/patient_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database database;
  static String patientTable = 'patient';
  static String id = 'Id';
  static String name = 'Name';
  static String disease = 'Disease';
  static String fees = 'Fees';
  static String doctor = 'Doctor';
  static String address = 'Address';

  static String doctorTable = 'Doctor';
  static String id1 = 'Id';
  static String name1 = 'Name';
  static String specialist = 'Specialist';
  static String fees1 = 'Fees';
  static String timing = 'Timing';
  static String imPath = 'Path';

  static String categoryTable = 'category';
  static String id2 = 'Id';
  static String category = 'Category';

  static Future createDatabase() async {
    String dbName = 'hospital.db';
    String path = await getDatabasesPath();
    String dbPath = join(path, dbName);
    database =
        await openDatabase(dbPath, version: 1, onCreate: (database, version) {
      database.execute(
          'create table $patientTable($id int primary key,$name text,$disease text,$fees int,$doctor text,$address text)');
      print("Table created successfully");
    });
  }

  static Future addPatientData(Patient patient) async {
    await database.rawInsert(
      'insert into $patientTable values(?,?,?,?,?,?)',
      [
        patient.id,
        patient.name,
        patient.disease,
        patient.fees,
        patient.doctor,
        patient.address
      ],
    );
    print('Data inserted successfully');
  }

  static Future<List<Patient>> getPatientData() async {
    List<Map<String, dynamic>> mapList =
        await database.rawQuery('select * from $patientTable');

    List<Patient> patList = [];
    for (int i = 0; i < mapList.length; i++) {
      Map<String, dynamic> map = mapList[i];
      Patient patientData = Patient.fromMap(map);
      patList.add(patientData);
    }
    return patList;
  }

  static Future deletePatient(int idNo) async {
    await database.rawDelete("delete from $patientTable where $id = $idNo");
    print("delete patient successfully");
  }

  static Future updatePatient(Patient patient) async {
    await database.rawUpdate(
        "update $patientTable set $name=?,$disease=?,$fees=?,$doctor=?,$address=? where $id=?",
        [
          patient.name,
          patient.disease,
          patient.fees,
          patient.doctor,
          patient.address,
          patient.id,
        ]);
    print("update patient successfully");
  }
}
