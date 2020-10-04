import 'package:crud_app/Screens/Welcome/Login/components/background.dart';
import 'package:crud_app/components/register_check.dart';
import 'package:crud_app/components/rounded_button.dart';
import 'package:crud_app/components/rounded_input.dart';
import 'package:crud_app/components/rounded_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
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
          RoundedInput(hintText: "Correo electrónico", onChanged: (value) {}),
          RoundedPassword(onChanged: (value) {}),
          RoundedButton(
            text: "LOGIN",
            press: () {},
          ),
          RegisterCheck(
            press: () {},
          )
        ],
      ),
    );
  }
}
