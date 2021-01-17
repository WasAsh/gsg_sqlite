import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';



class EmployeeNotes{

  int noteId ;
  String noteText ;
  int employeeId ;
  bool isHappy ;
  Employee employee ;

  EmployeeNotes({this.noteText , this.employeeId  ,this.isHappy , this.employee});

  Map <String , dynamic> toMap(){
    return{
      DataBaseHelper.dbHelper.notesText : this.noteText ,
      DataBaseHelper.dbHelper.columnId : this.employeeId ,
      'isHappy' : this.isHappy ? 1 : 0 ,
    };
  }

  EmployeeNotes.fromMap(Map<String , dynamic>map){
    this.noteId = map[DataBaseHelper.dbHelper.notesId];
    this.noteText = map[DataBaseHelper.dbHelper.notesText];
    this.employeeId = map[DataBaseHelper.dbHelper.columnId];
    this.isHappy = map['isHappy'] == 1 ? true : false ;
    this.employee = map['employee'] ;
  }

}