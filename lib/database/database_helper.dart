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

    });
  }













}
