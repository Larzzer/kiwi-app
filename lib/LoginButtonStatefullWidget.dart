import 'package:flutter/material.dart';
import 'DatabaseConnection.dart';
import 'LoginInputField.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
import 'MainMenu.dart';
import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';

class LoginButtonstatefullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginButtonstatefullWidgetState();
}

class _LoginButtonstatefullWidgetState extends State<LoginButtonstatefullWidget> {

  String username = "1";
  String password = "2";
  
  LoginInputField loginInputField = LoginInputField();
  Future<void> Checkingpassanduser() async {
    String storedUsername = store.get("username") ?? ""; // Get the stored username
    String storedPassword = store.get("password") ?? ""; // Get the stored password
    List<Map<String, dynamic>> results = await Database.executeSql("SELECT username,password FROM members WHERE username = '"+storedUsername+"';");

    if(storedUsername == results[0]["members"]["username"] && storedPassword == results[0]["members"]["password"]){
      print("Successfull login");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    } else {
      print("failed login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          Checkingpassanduser();
        },
        child: const Text ('Login'),

      ),
    );
  }
}