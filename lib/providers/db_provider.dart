import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';



class DataBaseProvider extends ChangeNotifier{

  List<Employee> employees = [] ;

  //fill lists
  fillLists(List<Employee>emp){
    this.employees = emp ;
    notifyListeners();
  }


  //get all
  getAllEmployees()async{
    List<Map<String , dynamic>> rows = await DataBaseHelper.dbHelper.getAllEmployees() ;
    List<Employee> emp = rows.map((e) => Employee.fromMap(e)).toList();
    fillLists(emp);
  }


  //insert
  insertToDb(Employee emp)async{
    await DataBaseHelper.dbHelper.saveEmployee(emp);
    getAllEmployees();
  }


  //get one
  getOneEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.getEmployee(emp.id);
    getAllEmployees();
  }

  //update
  updateEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.updateEmployee(emp);
    getAllEmployees();
  }

  //delete
  deleteEmployee(Employee emp)async{
    await DataBaseHelper.dbHelper.deleteEmployee(emp.id);
    getAllEmployees();
  }

  //get count
   getEmpCount()async{
    int val = await DataBaseHelper.dbHelper.getCount();
    return val ;
   }

}