import 'package:flutter/material.dart';
import 'package:eksamesprojekt_kiwi_app/LoginInputField.dart';
import 'GlobalState.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _username = "";
  String _password = "";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth * 3 / 5;
    double textFieldHeight = textFieldWidth / 5;

    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: textFieldWidth,
              height: textFieldHeight,
              child: TextField(
                controller: _usernameController,
                onChanged: (String value) {
                  setState(() {
                    _username = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'brugernavn',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: textFieldWidth,
              height: textFieldHeight,
              child: TextField(
                controller: _passwordController,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Kodeord',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the username and password in variables and navigate back to the login page
                store.set('Username', _username);
                store.set('Password', _password);
                Navigator.pop(context);
              },
              child: Text('Lav Bruger'),
            ),
          ],
        ),
      ),
    );
  }
}