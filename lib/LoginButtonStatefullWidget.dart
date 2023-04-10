import 'package:flutter/material.dart';
import 'LoginInputField.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
import 'MainMenu.dart';
class LoginButtonstatefullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginButtonstatefullWidgetState();
}

class _LoginButtonstatefullWidgetState extends State<LoginButtonstatefullWidget> {

  String username = "1";
  String password = "2";
  LoginInputField loginInputField = LoginInputField();
  void Checkingpassanduser(String inputUsername,String inputPassword) {
    String storedUsername = store.get("Username") ?? ""; // Get the stored username
    String storedPassword = store.get("Password") ?? ""; // Get the stored password
    if(storedUsername == username && storedPassword == password){
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
          String storedUsername = store.get("Username") ?? ""; // Get the stored username
          String storedPassword = store.get("Password") ?? ""; // Get the stored password
          Checkingpassanduser( storedUsername, storedPassword);
        },
        child: const Text ('Login'),

      ),
    );
  }
}