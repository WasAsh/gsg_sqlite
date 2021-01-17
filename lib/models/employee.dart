import 'package:gsg_sqlitedb/models/notes.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';


class Employee {

  int id ;
  String firstName ;
  String lastName ;
  String age ;
  String city ;
  String department ;
  EmployeeNotes notes ;

  Employee({this.firstName , this.lastName , this.age , this.city , this.department });

  Map <String , dynamic> toMap(){
    return{
      DataBaseHelper.dbHelper.columnFirstName : this.firstName ,
      DataBaseHelper.dbHelper.columnLastName : this.lastName ,
      DataBaseHelper.dbHelper.columnAge : this.age ,
      DataBaseHelper.dbHelper.columnCity : this.city ,
      DataBaseHelper.dbHelper.columnDepartment : this.department ,
    };
  }

  Employee.fromMap(Map<String , dynamic>map){

    this.id = map[DataBaseHelper.dbHelper.columnId] ;
    this.firstName = map[DataBaseHelper.dbHelper.columnFirstName] ;
    this.lastName = map[DataBaseHelper.dbHelper.columnLastName] ;
    this.age = map[DataBaseHelper.dbHelper.columnAge] ;
    this.city = map[DataBaseHelper.dbHelper.columnCity] ;
    this.department = map[DataBaseHelper.dbHelper.columnDepartment] ;
    this.notes = map['notes'] ;
  }


}