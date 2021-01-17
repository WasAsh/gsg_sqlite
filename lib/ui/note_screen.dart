import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/models/notes.dart';
import 'package:gsg_sqlitedb/providers/note_provider.dart';
import 'package:provider/provider.dart';



class NoteScreen extends StatefulWidget {
  final Employee employee ;
  NoteScreen(this.employee);
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  TextEditingController _noteController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            SizedBox(height: 10,) ,
            CheckboxListTile(
              title: Text('Is This Positive Note ?'),
              value: isChecked,
              activeColor: Colors.deepPurple,
              onChanged: (val){
                setState(() {
                  isChecked = val ;
                  print(val);
                });
              },
            ),
            SizedBox(height: 10,) ,
            Center(
              child: RaisedButton(
                child: Text('Add'),
                color: Colors.deepPurple,
                onPressed: (){
                  EmployeeNotes notes = EmployeeNotes(
                    noteText: _noteController.text ,
                    employeeId: widget.employee.id,
                    isHappy: isChecked ,
                  );
                  context.read<NoteProvider>().insertToDbNotes(notes);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
