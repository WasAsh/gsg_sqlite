import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/ui/edit_employee_screen.dart';
import 'package:gsg_sqlitedb/ui/employee_info.dart';
import 'package:provider/provider.dart';




class EmployeeWidget extends StatelessWidget {

  final Employee emp ;
  EmployeeWidget(this.emp);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  '${emp.firstName} ${emp.lastName}',
                  style: TextStyle(
                      fontSize: 22.0, color: Colors.redAccent
                  ),
                ),
                subtitle: Text(
                  'click here to show all employee information !',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                leading: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.amber,
                      child: Text(
                        '${emp.id}',
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                onTap: () => _navigateToEmployeeInfo(context, emp),
              ),
            ),
            new IconButton(
              icon: Icon(Icons.edit , color: Colors.blueAccent,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditEmployeeScreen(emp)));
              },
            ),
            new IconButton(
              icon: Icon(Icons.delete , color: Colors.red,),
              onPressed: () {
                context.read<DataBaseProvider>().deleteEmployee(emp);
              }
            ),
          ],
        ),
      ],
    );
  }

  void _navigateToEmployeeInfo(BuildContext context, Employee employee) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeInfo(employee)),
    );
  }

}
