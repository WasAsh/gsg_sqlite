
import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';



class DataBaseProvider extends ChangeNotifier{

  List<Employee> employees = [] ;

  fillLists(List<Employee>emp){
    this.employees = emp ;
    notifyListeners();
  }

  getAllEmployees()async{
    List<Map<String , dynamic>> rows = await DataBaseHelper.dbHelper.getAllEmployees() ;
    List<Employee> emp = rows.map((e) => Employee.fromMap(e)).toList();
    fillLists(emp);
  }

  insertToDb(Employee emp)async{
    await DataBaseHelper.dbHelper.saveEmployee(emp);
    getAllEmployees();
  }

  getOneEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.getEmployee(emp.id);
    getAllEmployees();
  }

  updateEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.updateEmployee(emp);
    getAllEmployees();
  }

  deleteEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.deleteEmployee(emp.id);
    getAllEmployees();
  }

}