import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';
import 'package:eksamesprojekt_kiwi_app/LoginPage.dart';
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
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  String _username = "";
  String _password = "";
  String _firstName = "";
  String _lastName = "";
  String _phoneNumber = "";
  String _email = "";
  String _passwordConfirmation = "";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    return _username.isNotEmpty &&
        _password.isNotEmpty &&
        _firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _phoneNumber.isNotEmpty &&
        _email.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double textFieldWidth = screenWidth * 3 / 5;
    double textFieldHeight = textFieldWidth / 5;

    return Scaffold(
        appBar: AppBar(title: Text('Registration')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  child: TextField(
                    controller: _firstNameController,
                    onChanged: (String value) {
                      setState(() {
                        _firstName = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  child: TextField(
                    controller: _lastNameController,
                    onChanged: (String value) {
                      setState(() {
                        _lastName = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  child: TextField(
                    controller: _phoneNumberController,
                    onChanged: (String value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  child: TextField(
                    controller: _emailController,
                    onChanged: (String value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
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
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  child: TextField(
                    onChanged: (String value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_validateInputs()) {
// Save the registration data to Global State and navigate to Home page
                        String insertSql = "INSERT INTO members "
                            "(\"first-name\", \"last-name\", \"phone-number\", email, username, password, active) "
                            "VALUES ('$_firstName', '$_lastName', '$_phoneNumber', '$_email', '$_username', '$_password', true);";
                          await Database.executeSql(insertSql);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('udfyld alle felter'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: Text('REGISTER'),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Already have an account? Login here'),
                ),
              ],
            ),
          ),
    )
    );
  }
}