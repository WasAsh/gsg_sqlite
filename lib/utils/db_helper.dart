import 'dart:async';
import 'dart:io';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DataBaseHelper {

  DataBaseHelper._();
  static DataBaseHelper dbHelper = DataBaseHelper._();
  Database db;

  final String tableEmployee = 'employeeTable';
  final String columnId = 'id' ;
  final String columnFirstName = 'firstName' ;
  final String columnLastName = 'lastName' ;
  final String columnAge = 'age' ;
  final String columnCity = 'city' ;
  final String columnDepartment = 'department' ;
  final String columnDescription = 'description' ;

  initDataBase()async{
    if(db == null){
      db = await connectDb();
    }
  }

  Future<Database> connectDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String appPath = dir.path;
    String dbPath = join(appPath , 'employees.db');
    Database db = await openDatabase(dbPath , version: 1 , onCreate: onCreate);
    return db ;
  }

  onCreate(Database db , int newVersion){
    db.execute('CREATE TABLE $tableEmployee ($columnId INTEGER PRIMARY KEY,'
        '$columnFirstName TEXT, $columnLastName TEXT, $columnAge TEXT,'
        '$columnCity TEXT, $columnDepartment TEXT, $columnDescription TEXT )');
  }

  Future<int> saveEmployee (Employee employee) async {
    var result = await db.insert(tableEmployee , employee.toMap() ) ;
    return result ;
  }


  Future<List> getAllEmployees () async {
    var result = await db.query(
        tableEmployee ,
        columns: [columnId , columnFirstName ,
          columnLastName , columnAge , columnCity ,
          columnDepartment , columnDescription]
    ) ;
    return result.toList() ;
  }

  Future<int> getCount () async {
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableEmployee')) ;
  }

  Future<Employee> getEmployee (int id) async {
    List<Map> result = await db.query(
        tableEmployee ,
        columns: [columnId , columnFirstName ,
          columnLastName , columnAge , columnCity ,
          columnDepartment , columnDescription] ,
        where: '$columnId = ?' ,
        whereArgs: ['id']
    ) ;
    if(result.length > 0){
      return Employee.fromMap(result.first) ;
    }
    return null ;
  }

  Future<int> updateEmployee (Employee employee) async {
    return await db.update(tableEmployee , employee.toMap() ,
        where: '$columnId = ?' ,
        whereArgs: [employee.id]
    ) ;
  }

  Future<int> deleteEmployee (int id) async {
    return await db.delete(tableEmployee ,
        where: '$columnId = ?' ,
        whereArgs: [id]
    ) ;
  }

  Future close () async {
    return await db.close() ;
  }

}