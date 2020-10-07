import 'package:crud_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_app/model/persona.dart';

class ScreenPersona extends StatefulWidget {
  final Persona persona;
  ScreenPersona(this.persona);

  @override
  _ScreenPersonaState createState() => _ScreenPersonaState();
}

final personaRef = FirebaseDatabase.instance.reference().child('persona');

class _ScreenPersonaState extends State<ScreenPersona> {
  List<Persona> items;

  TextEditingController nombreController;
  TextEditingController apellidoController;
  TextEditingController edadController;
  TextEditingController telController;
  TextEditingController dirController;
  TextEditingController mailController;

  @override
  void initState() {
    super.initState();
    nombreController = new TextEditingController(text: widget.persona.nombre);
    apellidoController =
        new TextEditingController(text: widget.persona.apellido);
    edadController = new TextEditingController(text: widget.persona.edad);
    telController = new TextEditingController(text: widget.persona.tel);
    dirController = new TextEditingController(text: widget.persona.dir);
    mailController = new TextEditingController(text: widget.persona.mail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Personas DB"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: 640.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nombreController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nombre ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: apellidoController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Apellido ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: edadController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Edad ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: telController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Teléfono ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: dirController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.map),
                    labelText: 'Dirección ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: mailController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Correo ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                FlatButton(
                  onPressed: () {
                    if (widget.persona.id != null) {
                      personaRef.child(widget.persona.id).set({
                        'nombre': nombreController.text,
                        'apellido': apellidoController.text,
                        'edad': edadController.text,
                        'tel': telController.text,
                        'dir': dirController.text,
                        'mail': mailController.text
                      }).then((_) => {Navigator.pop(context)});
                    } else {
                      personaRef.push().set({
                        'nombre': nombreController.text,
                        'apellido': apellidoController.text,
                        'edad': edadController.text,
                        'tel': telController.text,
                        'dir': dirController.text,
                        'mail': mailController.text
                      }).then((_) => {Navigator.pop(context)});
                    }
                  },
                  child: (widget.persona.id != null)
                      ? Text('Update')
                      : Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
