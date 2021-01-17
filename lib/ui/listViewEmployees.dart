import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/ui/all_notes_screen.dart';
import 'package:gsg_sqlitedb/ui/employee_screen.dart';
import 'package:gsg_sqlitedb/ui/shared/employee_widget.dart';
import 'package:provider/provider.dart';



class ListViewEmployees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewEmployeesState();
  }
}

class _ListViewEmployeesState extends State<ListViewEmployees> {

  Employee employee ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Employees'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<DataBaseProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: value.employees.length,
                  itemBuilder: (context, index) {
                    return EmployeeWidget(
                      value.employees[index],
                      "${value.employees[index].firstName} ${value.employees[index].lastName}",
                      value.employees[index].id.toString(),
                    );
                  }),
              Text('Total employees : ${value.employees.length}'),
            ],
          );
        },
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          'W' ,
                          style: TextStyle(
                            color: Colors.deepPurple ,
                            fontSize: 30 ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,) ,
                    Text(
                      'waseem.al@gmail.com' ,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('All Employee Notes' , style: TextStyle(color: Colors.deepPurple),),
                leading: Icon(Icons.note , color: Colors.deepPurple,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AllNotesScreen()
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EmployeeScreen()));
        },
      ),
    );
  }
}
