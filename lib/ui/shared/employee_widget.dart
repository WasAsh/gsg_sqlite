import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/ui/edit_employee_screen.dart';
import 'package:gsg_sqlitedb/ui/employee_info.dart';
import 'package:provider/provider.dart';




class EmployeeWidget extends StatelessWidget {

  final Employee emp ;
  String employeeName;
  String employeeId ;
  EmployeeWidget(this.emp , this.employeeName , this.employeeId);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      child: Column(
        children: <Widget>[
          Divider(
            height: 5.0,
          ),
          Card(
            color: Colors.deepPurple[200],
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text(
                      employeeName,
                      style: TextStyle(
                          fontSize: 18, color: Colors.deepPurple
                      ),
                    ),
                    subtitle: Text(
                      'click here to show all employee information !',
                      style: TextStyle(
                        fontSize: 12,
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
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            employeeId,
                            style: TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => _navigateToEmployeeInfo(context, emp),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit , color: Colors.blueAccent,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditEmployeeScreen(emp)));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete , color: Colors.red,),
                  onPressed: () {
                    context.read<DataBaseProvider>().deleteEmployee(emp);
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToEmployeeInfo(BuildContext context, Employee employee) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeInfo(employee)),
    );
  }

}
