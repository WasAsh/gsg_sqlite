import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/providers/note_provider.dart';
import 'package:gsg_sqlitedb/ui/shared/note_widget.dart';
import 'package:provider/provider.dart';

class AllNotesScreen extends StatefulWidget {
  @override
  _AllNotesScreenState createState() => _AllNotesScreenState();
}

class _AllNotesScreenState extends State<AllNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Employees Notes'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Consumer<NoteProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.notes.length,
                    itemBuilder: (context , index){
                      return NoteWidget(
                        noteText: value.notes[index].noteText ?? null,
                        noteId: value.notes[index].noteId.toString() ?? null,
                        deleteNote: (){
                          context.read<NoteProvider>().deleteEmployeeNote(value.notes[index]);
                        },
                        noteEmployee: 'Dummy',
                        employeeDep: 'Dummy',
                        color: value.notes[index].isHappy ? Colors.green : Colors.red,
                      );
                    }
                  ),
                  Text('Total notes : ${value.notes.length}'),
                ],
              );
            }
        ));
  }
}
