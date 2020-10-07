import 'package:crud_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_app/model/persona.dart';

class InfoPersona extends StatefulWidget {
  final Persona persona;
  InfoPersona(this.persona);

  @override
  _InfoPersonaState createState() => _InfoPersonaState();
}

final personaRef = FirebaseDatabase.instance.reference().child('persona');

class _InfoPersonaState extends State<InfoPersona> {
  List<Persona> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Información'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(
                  "Nombre: ${widget.persona.nombre}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                new Text(
                  "Apellido: ${widget.persona.apellido}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                new Text(
                  "Edad: ${widget.persona.edad}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                new Text(
                  "Teléfono: ${widget.persona.tel}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                new Text(
                  "Dirección: ${widget.persona.dir}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                new Text(
                  "Correo: ${widget.persona.mail}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
