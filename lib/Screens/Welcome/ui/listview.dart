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
    changePersona = personaRef.onChildChanged.listen(_updatePersona);

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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Agenda"),
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
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 17.0,
                                child: Text(
                                  '${position + 1}',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 21.0),
                                ),
                              )
                            ],
                          ),
                          onTap: () => infoPersona(context, items[position]),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => borrarPersona(
                              context, items[position], position)),
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: kLightColor,
                          ),
                          onPressed: () =>
                              verPersona(context, items[position])),
                    ],
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () => agregarPersona(context)),
      ),
    );
  }

  void _addPersona(Event event) {
    setState(() {
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }

  void _updatePersona(Event event) {
    var oldPersona =
        items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPersona)] =
          new Persona.fromSnapShot(event.snapshot);
    });
  }

  void borrarPersona(
      BuildContext context, Persona persona, int position) async {
    await personaRef.child(persona.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void infoPersona(BuildContext context, Persona persona) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenPersona(persona),
        ));
  }

  void verPersona(BuildContext context, Persona persona) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPersona(persona),
        ));
  }

  void agregarPersona(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScreenPersona(Persona(null, '', '', '', '', '', '')),
        ));
  }
}
