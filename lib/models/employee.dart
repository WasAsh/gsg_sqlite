

import 'package:gsg_sqlitedb/utils/db_helper.dart';

class Employee {

  int id ;
  String firstName ;
  String lastName ;
  String age ;
  String city ;
  String department ;
  String description ;

  Employee({this.firstName , this.lastName , this.age , this.city , this.department , this.description});

  Map <String , dynamic> toMap(){
    return{
      DataBaseHelper.dbHelper.columnFirstName : this.firstName ,
      DataBaseHelper.dbHelper.columnLastName : this.lastName ,
      DataBaseHelper.dbHelper.columnAge : this.age ,
      DataBaseHelper.dbHelper.columnCity : this.city ,
      DataBaseHelper.dbHelper.columnDepartment : this.department ,
      DataBaseHelper.dbHelper.columnDescription : this.description ,
    };
  }

  Employee.fromMap(Map<String , dynamic>map){

    this.id = map[DataBaseHelper.dbHelper.columnId] ;
    this.firstName = map[DataBaseHelper.dbHelper.columnFirstName] ;
    this.lastName = map[DataBaseHelper.dbHelper.columnLastName] ;
    this.age = map[DataBaseHelper.dbHelper.columnAge] ;
    this.city = map[DataBaseHelper.dbHelper.columnCity] ;
    this.department = map[DataBaseHelper.dbHelper.columnDepartment] ;
    this.description = map[DataBaseHelper.dbHelper.columnDescription] ;

  }


}