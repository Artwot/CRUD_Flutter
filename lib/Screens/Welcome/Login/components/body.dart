import 'package:crud_app/Screens/Welcome/Login/components/background.dart';
import 'package:crud_app/Screens/Welcome/Register/register_screen.dart';
import 'package:crud_app/Screens/Welcome/ui/listview.dart';
import 'package:crud_app/components/register_check.dart';
import 'package:crud_app/components/rounded_button.dart';
import 'package:crud_app/components/rounded_input_email.dart';
import 'package:crud_app/components/rounded_password.dart';
import 'package:crud_app/components/text_field.dart';
import 'package:crud_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  String _email = 'halconm26@gmail.com';
  String _password = 'halcones2019';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputEmail(
            hintText: "Correo electrónico",
            onChanged: (value) {
              _email = value;
              print("El email es: " + _email);
            },
          ),
          RoundedPassword(onChanged: (value) {
            _password = value;
            print("Pass: " + _password);
          }),
          RoundedButton(
            text: "LOGIN",
            press: () async {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                //return ListViewPersona();
              }));*/
              print('**************');
              print(_email);
              print(_password);
              try {
                /*FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email, password: _password);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewPersona();
                }));*/
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _email, password: _password);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewPersona();
                }));
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  final snackBar = SnackBar(
                    content: Text('Usuario inexistente.'),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  final snackBar = SnackBar(
                    content: Text('Contraseña incorrecta.'),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              }
            },
          ),
          RegisterCheck(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisterScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}

/*class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yeah, yeah, la muñeca fea'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}*/
