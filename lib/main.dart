import 'package:blu_plus_app/BLEFunctions/DBHandler.dart';
import 'package:blu_plus_app/home.dart';
import 'package:blu_plus_app/pages/brain_page.dart';
import 'package:blu_plus_app/pages/LoadErrorCategories.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      routes: {
        BrainPage.brainName: (context) =>BrainPage(),
        LoadJSONFile.jfile : (context)=>LoadJSONFile(),
      },
      home:Home()
    );
  }
}
