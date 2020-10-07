import 'package:crud_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'screen_persona.dart';
import 'info_persona.dart';
import 'package:crud_app/model/persona.dart';

class ListViewPersona extends StatefulWidget {
  @override
  _ListViewPersonaState createState() => _ListViewPersonaState();
}

//Referencia a la tabla de Firebase:
final personaRef = FirebaseDatabase.instance.reference().child('persona');

class _ListViewPersonaState extends State<ListViewPersona> {
  //Lista de las personas:
  List<Persona> items;
  //Creo que añade una personan aún no sé muy bien, jejejje:
  StreamSubscription<Event> addPersona;
  StreamSubscription<Event> changePersona;

  @override
  void initState() {
    super.initState();
    items = new List();
    addPersona = personaRef.onChildAdded.listen(_addPersona);
    changePersona = personaRef.onChildChanged.listen(_changePersona);

    @override
    void dispose() {
      super.dispose();
      addPersona.cancel();
      changePersona.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Personal',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hola, cara de bola"),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Divider(
                    height: 7.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[position].nombre}',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 21.0),
                          ),
                          subtitle: Text(
                            '${items[position].nombre}',
                            style:
                                TextStyle(color: kLightColor, fontSize: 18.0),
                          ),
                          leading: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 17.0,
                                child: Text(
                                  '${items[position].apellido}',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 21.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addPersona(Event event) {
    setState(() {
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }

  void _changePersona(Event event) {
    setState(() {
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }
}
