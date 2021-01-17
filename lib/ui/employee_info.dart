import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'file:///C:/Users/wass/AndroidStudioProjects/gsg_sqlitedb/lib/ui/add_note_screen.dart';



class EmployeeInfo extends StatefulWidget{

  final Employee employee ;
  EmployeeInfo(this.employee) ;

  @override
  State<StatefulWidget> createState() {
    return _EmployeeInfoState();
  }

}

class _EmployeeInfoState extends State<EmployeeInfo>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Information'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true ,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person , color: Colors.deepPurple,) ,
                SizedBox(width: 5,),
                Text(
                  '${widget.employee.firstName} ${widget.employee.lastName}' ,
                  style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            Divider() ,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.perm_identity , color: Colors.deepPurple,) ,
                SizedBox(width: 5,),
                Text(
                  widget.employee.age ,
                  style: TextStyle(
                      fontSize: 18 ,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            Divider() ,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.home , color: Colors.deepPurple,) ,
                SizedBox(width: 5,),
                Text(
                  widget.employee.city ,
                  style: TextStyle(
                      fontSize: 18 ,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            Divider() ,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.grade , color: Colors.deepPurple,) ,
                SizedBox(width: 5,),
                Text(
                  widget.employee.department ,
                  style: TextStyle(
                      fontSize: 18 ,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            Divider(),
            SizedBox(height: 20,) ,
            Center(
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddNoteScreen(widget.employee)
                  ));
                },
                color: Colors.deepPurple,
                child: Text(
                  'Notes' ,
                  style: TextStyle(
                      fontSize: 18 ,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}