import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/notes.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';



class NoteProvider extends ChangeNotifier{

  List<EmployeeNotes> notes = [] ;

  fillNotesList(List<EmployeeNotes>empNotes){
    this.notes = empNotes ;
    notifyListeners();
  }

  getAllEmployeesNotes()async{
    List<Map<String , dynamic>> rows = await DataBaseHelper.dbHelper.getAllEmployeesNotes() ;
    List<EmployeeNotes> notes = rows.map((e) => EmployeeNotes.fromMap(e)).toList();
    fillNotesList(notes);
  }

  insertToDbNotes(EmployeeNotes notes)async{
    await DataBaseHelper.dbHelper.saveEmployeeNotes(notes);
    getAllEmployeesNotes();
  }

  deleteEmployeeNote(EmployeeNotes notes)async{
    await DataBaseHelper.dbHelper.deleteEmployeeNote(notes.noteId);
    getAllEmployeesNotes();
  }

  getEmpCountNote()async{
    int val = await DataBaseHelper.dbHelper.getCountNotes();
    return val ;
  }

}