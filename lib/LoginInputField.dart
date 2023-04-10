import 'package:eksamesprojekt_kiwi_app/LoginButtonStatefullWidget.dart';
import 'package:flutter/material.dart';
import 'GlobalState.dart';
import 'package:eksamesprojekt_kiwi_app/RegistrationPage.dart';

class LoginInputField extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  getUsername(){
    return _usernameController.text;
  }

  getPassword(){
    return _passwordController.text;
  }


  void _onRegistrationButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationPage()),
    );
  }


  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _usernameController,
            onChanged: (String value){
              store.set("Username", value);
            },
            decoration: InputDecoration(
                hintText: "Enter your username",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _passwordController,
            onChanged: (String value){
              store.set("Password", value);
            },
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text(
                "ny bruger",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,


                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}