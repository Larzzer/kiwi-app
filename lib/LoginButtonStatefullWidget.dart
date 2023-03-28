import 'package:flutter/material.dart';
import 'LoginInputField.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
class LoginButtonstatefullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginButtonstatefullWidgetState();
}

class _LoginButtonstatefullWidgetState extends State<LoginButtonstatefullWidget> {
  String username = "Kiwi1";
  String password = "KiwiLover";
  LoginInputField loginInputField = LoginInputField();
  void Checkingpassanduser(String inputUsername,String inputPassword) {
    if(inputUsername == username && inputPassword == password){
      print("Successfull login");
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
          Checkingpassanduser( "Kiwi1", "KiwiLover");
          print(store.get("titleTextValue").toString());


        },
        child: const Text ('Login'),

      ),
    );
  }
}


