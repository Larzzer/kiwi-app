import 'package:flutter/material.dart';
import 'DatabaseConnection.dart';
import 'LoginPage.dart';
import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';

void main() async {
  final db = Database();
  await db.connectToDatabase();
  // Run the app
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}