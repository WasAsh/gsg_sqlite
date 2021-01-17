import 'dart:async';
import 'dart:io';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/models/notes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static DataBaseHelper dbHelper = DataBaseHelper._();
  Database db;

  final String tableEmployee = 'employeeTable';
  final String columnId = 'id';
  final String columnFirstName = 'firstName';
  final String columnLastName = 'lastName';
  final String columnAge = 'age';
  final String columnCity = 'city';
  final String columnDepartment = 'department';
  final String tableEmployeeNotes = 'employeeNotesTable';
  final String notesId = 'notesId';
  final String notesText = 'text';
  final String isHappy = 'isHappy';


  initDataBase() async {
    if (db == null) {
      db = await connectDb();
    }
  }

  Future<Database> connectDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String appPath = dir.path;
    String dbPath = join(appPath, 'employees.db');
    Database db =
        await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      onCreateEmployee(db, version);
      onCreateEmployeeNotes(db, version);
    });
    return db;
  }

  onCreateEmployee(Database db , int version){
    db.execute("CREATE TABLE $tableEmployee ("
        "$columnId INTEGER PRIMARY KEY, "
        "$columnFirstName TEXT, "
        "$columnLastName TEXT, "
        "$columnAge TEXT, "
        "$columnCity TEXT, "
        "$columnDepartment TEXT "
        ")");
  }
  onCreateEmployeeNotes(Database db , int version){
    db.execute("CREATE TABLE $tableEmployeeNotes ("
        "$notesId INTEGER PRIMARY KEY, "
        "$notesText TEXT, "
        "$isHappy INTEGER, "
        "$columnId INTEGER, "
        "FOREIGN KEY($columnId) REFERENCES $tableEmployee($columnId)"
        ")");
  }

  // save
  Future<int> saveEmployeeNotes(EmployeeNotes employeeNotes) async {
    var result = await db.insert(tableEmployeeNotes, employeeNotes.toMap());
    return result;
  }

  Future<int> saveEmployee(Employee employee) async {
    var result = await db.insert(tableEmployee, employee.toMap());
    return result;
  }

  //get all
  Future<List> getAllEmployees() async {
    var result = await db.query(tableEmployee, columns: [
      columnId,
      columnFirstName,
      columnLastName,
      columnAge,
      columnCity,
      columnDepartment,
    ]);
    return result.toList();
  }

  Future<List> getAllEmployeesNotes() async {
    var result = await db.query(tableEmployeeNotes, columns: [
      notesId,
      notesText,
      isHappy,
      columnId
    ]);
    return result.toList();
  }

  //get count
  Future<int> getCount() async {
    int count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableEmployee'));
    return count;
  }
  Future<int> getCountNotes() async {
    int count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableEmployeeNotes'));
    return count;
  }

  //get and select one
  Future<Employee> getEmployee(int id) async {
    List<Map> result = await db.query(
      tableEmployee,
      columns: [
        columnId,
        columnFirstName,
        columnLastName,
        columnAge,
        columnCity,
        columnDepartment,
      ],
      where: '$columnId = ?',
      whereArgs: ['id'],
    );
    if (result.length > 0) {
      return Employee.fromMap(result.first);
    }
    return null;
  }

  //update
  Future<int> updateEmployee(Employee employee) async {
    return await db.update(tableEmployee, employee.toMap(),
        where: '$columnId = ?', whereArgs: [employee.id]);
  }

  //delete
  Future<int> deleteEmployee(int id) async {
    return await db
        .delete(tableEmployee, where: '$columnId = ?', whereArgs: [id]);
  }
  Future<int> deleteEmployeeNote(int id) async {
    return await db
        .delete(tableEmployeeNotes, where: '$notesId = ?', whereArgs: [id]);
  }

  Future close() async {
    return await db.close();
  }
}
