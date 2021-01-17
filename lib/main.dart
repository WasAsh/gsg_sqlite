import 'package:flutter/material.dart';
import 'package:gsg_sqlitedb/providers/db_provider.dart';
import 'package:gsg_sqlitedb/providers/note_provider.dart';
import 'package:gsg_sqlitedb/ui/splash_screen.dart';
import 'package:gsg_sqlitedb/utils/db_helper.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.dbHelper.initDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataBaseProvider>(create: (_) => DataBaseProvider(),) ,
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider(),) ,
      ],
      child: MaterialApp(
        title: 'Employees',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}