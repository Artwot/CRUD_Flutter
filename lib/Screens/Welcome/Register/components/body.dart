import 'package:crud_app/Screens/Welcome/Register/components/background.dart';
import 'package:crud_app/components/rounded_button.dart';
import 'package:crud_app/components/rounded_input.dart';
import 'package:crud_app/components/rounded_input_email.dart';
import 'package:crud_app/components/rounded_input_number.dart';
import 'package:crud_app/components/rounded_password.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedInput(hintText: "Nombre", onChanged: (value) {}),
          RoundedInput(hintText: "Apellido paterno", onChanged: (value) {}),
          RoundedInput(hintText: "Apellido materno", onChanged: (value) {}),
          RoundedInputEmail(
              hintText: "Correo electronico", onChanged: (value) {}),
          RoundedPassword(onChanged: (value) {}),
          RoundedInputNumber(
              hintText: "Numero telefonico", onChanged: (value) {}),
          RoundedButton(
            text: "Acept",
            press: () {},
          ),
        ],
      ),
    );
  }
}
