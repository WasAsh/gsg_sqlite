import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/models/employee.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/ui/employee_info.dart';
import 'package:gsg_sqlitedb/ui/employee_screen.dart';
import 'package:gsg_sqlitedb/ui/shared/employee_widget.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';
import 'package:provider/provider.dart';


class ListViewEmployees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewEmployeesState();
  }
}

class _ListViewEmployeesState extends State<ListViewEmployees> {

  // List<Employee> items = List();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   DataBaseHelper.dbHelper.getAllEmployees().then((employees) {
  //     setState(() {
  //       employees.forEach((employee) {
  //         items.add(Employee.fromMap(employee));
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Employees'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Consumer<DataBaseProvider>(
        builder: (context , value , child){
          return Center(
            child: Column(
              children: value.employees.map((e) => EmployeeWidget(e)).toList(),
            ),
          );
        },
    ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreen()));
          },
        ),
      );
  }


  // void _navigateToEmployee(BuildContext context, Employee employee) async {
  //   String result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => EmployeeScreen()),
  //   );
  //   if (result == 'update') {
  //     DataBaseHelper.dbHelper.getAllEmployees().then((employees) {
  //       setState(() {
  //         items.clear();
  //         employees.forEach((employee) {
  //           items.add(Employee.fromMap(employee));
  //         });
  //       });
  //     });
  //   }
  // }
  //
  // void _createNewEmplyee(BuildContext context) async{
  //   String result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => EmployeeScreen()),
  //   );
  //   if (result == 'save') {
  //     DataBaseHelper.dbHelper.getAllEmployees().then((employees) {
  //       setState(() {
  //         items.clear();
  //         employees.forEach((employee) {
  //           items.add(Employee.fromMap(employee));
  //         });
  //       });
  //     });
  //   }
  // }


}
