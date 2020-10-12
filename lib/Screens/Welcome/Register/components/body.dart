import 'package:crud_app/Screens/Welcome/Register/components/background.dart';
import 'package:crud_app/Screens/Welcome/ui/listview.dart';
import 'package:crud_app/components/rounded_button.dart';
import 'package:crud_app/components/rounded_input.dart';
import 'package:crud_app/components/rounded_input_email.dart';
import 'package:crud_app/components/rounded_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  String _email = '';
  String _password = '';
  Body({
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
            "Registrarse",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedInput(hintText: "Nombre", onChanged: (value) {}),
          RoundedInput(hintText: "Apellido paterno", onChanged: (value) {}),
          RoundedInput(hintText: "Apellido materno", onChanged: (value) {}),
          RoundedInputEmail(
              hintText: "Correo electronico",
              onChanged: (value) {
                _email = value;
                print("El email es: " + _email);
              }),
          RoundedPassword(onChanged: (value) {
            _password = value;
            print("Pass: " + _password);
          }),
          RoundedButton(
            text: "Registrarse",
            press: () async {
              print('**************');
              print(_email);
              print(_password);
              try {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email, password: _password);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewPersona();
                }));
              } catch (e) {
                print("Ups");
              }
            },
          ),
        ],
      ),
    );
  }
}
