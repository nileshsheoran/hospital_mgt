import 'package:hospital_mgt/doctor/model/doctor_model.dart';
import 'package:hospital_mgt/patient/model/patient_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../doctor/model/category_model.dart';

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
            "create table $doctorTable($id1 int primary key,$name1 text,$specialist text,$fees1 int,$timing int,$imPath text)");
        print('table create successfully');
        database.execute("create table $categoryTable($id2 int primary key,$category text)");
        print('table create successfully');
    });

  }

  static Future addDoctor(Doctor doctorModel) async {
    await database.rawInsert("insert into $doctorTable values(?,?,?,?,?,?)", [
      doctorModel.id,
      doctorModel.name,
      doctorModel.specialist,
      doctorModel.fees,
      doctorModel.timing,
      doctorModel.path,
    ]);
  }

  static Future<List<Doctor>> getDoctorData() async {
    List<Map<String, dynamic>> mapList =
    await database.rawQuery("select * from $doctorTable");

    List<Doctor> doctorList = [];
    for (int i = 0; i < mapList.length; i++) {
      Map<String, dynamic> map = mapList[i];
      Doctor doctorModel = Doctor.fromMap(map);
      doctorList.add(doctorModel);
    }
    return doctorList;
  }

  static Future deleteDoctor(int Idno) async {
    await database.rawDelete("delete from $doctorTable where $id=$Idno");
    print('Delete successfully');
  }

  static Future updateDoctor(Doctor doctor) async {
    await database.rawUpdate(
        "update $doctorTable set $name1=?,$specialist=?,$fees1=?,$timing=? ,$imPath=? where $id1=?",
        [
          doctor.name,
          doctor.specialist,
          doctor.fees,
          doctor.timing,
          doctor.path,
          doctor.id
        ]);
    print('Update Doctor Successfully');
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

  static Future<List<Category>> getCategoryData() async {
    List<Map<String, dynamic>> mapList =
        await database.rawQuery("select * from $categoryTable");
    List<Category> categoryList = [];
    for (int i = 0; i < mapList.length; i++) {
      Map<String, dynamic> map = mapList[i];
      Category categoryModel = Category.fromMap(map);
      categoryList.add(categoryModel);
    }
    return categoryList;
  }

  static Future addCategory(Category categoryModel) async {
    await database.rawInsert("insert into $categoryTable values(?,?)", [
      categoryModel.id,
      categoryModel.category,
    ]);
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

  static Future deleteCategory(int idno) async {
    await database.rawDelete("delete from $categoryTable where $id=$idno");
    print('Delete successfully');
  }

  static Future updateCategory(Category categoryModel) async {
    await database.rawUpdate(
        "update $categoryTable set $category=? where $id1=?",
        [
          categoryModel.id,
          categoryModel.category,
        ]);
    print('Update Category Successfully');
  }

}
