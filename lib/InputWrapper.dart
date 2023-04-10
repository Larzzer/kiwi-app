import 'package:eksamesprojekt_kiwi_app/LoginButtonStatefullWidget.dart';
import 'package:eksamesprojekt_kiwi_app/LoginInputField.dart';
import 'package:flutter/material.dart';
import 'InputField.dart';



class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: LoginInputField(),
          ),
          SizedBox(height: 40,),
          LoginButtonstatefullWidget()
        ],
      ),
    );
  }
}