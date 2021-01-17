import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:provider/provider.dart';



class EmployeeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EmployeeScreenState();
  }

}

class _EmployeeScreenState extends State<EmployeeScreen>{

  TextEditingController _firstNameController = TextEditingController() ;
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee DB'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true ,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            RaisedButton(
              child: Text('Save' , style: TextStyle(color: Colors.white),),
              color: Colors.deepPurple,
              onPressed: () {
                Employee emp = Employee(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  age: _ageController.text,
                  city: _cityController.text,
                  department: _departmentController.text,
                );
                context.read<DataBaseProvider>().insertToDb(emp);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

}