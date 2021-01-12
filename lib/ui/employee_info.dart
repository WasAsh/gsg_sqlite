import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:provider/provider.dart';


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
      body: Consumer<DataBaseProvider>(
        builder: (context , value , child){
          return Container(
            margin: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Employee First Name : ${widget.employee.firstName}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Employee Last Name : ${widget.employee.lastName}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Employee Age : ${widget.employee.age}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Employee City : ${widget.employee.city}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Employee Department : ${widget.employee.department}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),
                Text(
                  'Description : ${widget.employee.description}' ,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0),),

              ],
            ),
          );
        },
      ),
    );
  }

}