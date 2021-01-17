import 'package:flutter/material.dart';


class NoteWidget extends StatelessWidget {
  final String noteText;
  final String noteEmployee;
  final String noteId;
  final String employeeDep ;
  final Color color ;
  final Function deleteNote;
  NoteWidget({this.noteText, this.noteEmployee, this.noteId , this.employeeDep ,this.color , this.deleteNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          Divider(
            height: 5.0,
          ),
          Card(
            color: color,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            noteId,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.info , size: 15, color: Colors.deepPurple,),
                                SizedBox(width: 10,),
                                Text(
                                  noteText ,
                                  style: TextStyle(
                                    color: Colors.deepPurple ,
                                    fontSize: 18 ,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.person , size: 15, color: Colors.deepPurple,),
                                SizedBox(width: 10,),
                                Text(
                                    noteEmployee ,
                                  style: TextStyle(
                                      color: Colors.deepPurple ,
                                      fontSize: 14 ,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.grade , size: 15, color: Colors.deepPurple,),
                                SizedBox(width: 10,),
                                Text(
                                    employeeDep ,
                                  style: TextStyle(
                                    color: Colors.deepPurple ,
                                    fontSize: 14 ,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    deleteNote();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
