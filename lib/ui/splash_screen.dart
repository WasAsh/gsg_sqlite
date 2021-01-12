import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/ui/listViewEmployees.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListViewEmployees()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DataBaseProvider>(context).getAllEmployees();
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListViewEmployees()));
            },
            child: Text(
              'Hello!' ,
              style: TextStyle(
                color: Colors.deepPurple ,
                fontSize: 18 ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

