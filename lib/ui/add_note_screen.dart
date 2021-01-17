import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/note_provider.dart';
import 'package:gsg_sqlitedb/ui/note_screen.dart';
import 'package:gsg_sqlitedb/ui/shared/note_widget.dart';
import 'package:provider/provider.dart';




class AddNoteScreen extends StatefulWidget {

  final Employee employee ;
  AddNoteScreen(this.employee);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Notes'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.add , color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NoteScreen(widget.employee)
              ));
            },
          )
        ],
      ),
      body: Consumer<NoteProvider>(
        builder: (context , value , child){
          return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: value.notes.length,
                itemBuilder: (context , index){
                  return value.notes.length != null
                      ? value.notes[index].employeeId == widget.employee.id
                      ? NoteWidget(
                    noteText: value.notes[index].noteText,
                    noteEmployee: "${widget.employee.firstName} ${widget.employee.lastName}",
                    noteId: value.notes[index].noteId.toString(),
                    employeeDep: widget.employee.department,
                    color: value.notes[index].isHappy ? Colors.green : Colors.red,
                    deleteNote: (){
                      print(value.notes[index].noteText);
                      context.read<NoteProvider>().deleteEmployeeNote(value.notes[index]);
                    },
                  )
                      :Container()
                      :Container();
                },
              );
        },
      ),
    );
  }
}


