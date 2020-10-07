//Modelo con la BD que contendrá los datos para Firebase.

import 'package:firebase_database/firebase_database.dart';

class Persona {
  //Datos de la BD:
  String id;
  String nombre;
  String apellido;
  String edad;
  String tel;
  String dir;
  String mail;

  Persona(this.id, this.nombre, this.apellido, this.edad, this.tel, this.dir,
      this.mail);

  //Mapeo para estructurar los datos:
  Persona.map(dynamic obj) {
    this.nombre = obj['nombre'];
    this.apellido = obj['apellido'];
    this.edad = obj['edad'];
    this.tel = obj['tel'];
    this.dir = obj['dir'];
    this.mail = obj['mail'];
  }

  //Getters de las variables.
  String get getID => id;
  String get getNombre => nombre;
  String get getApe => apellido;
  String get getEdad => edad;
  String get getTel => tel;
  String get getDir => dir;
  String get getMail => mail;

  //Para crear una tabla en Firebase:
  Persona.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    apellido = snapshot.value['apellido'];
    edad = snapshot.value['edad'];
    tel = snapshot.value['tel'];
    dir = snapshot.value['dir'];
    mail = snapshot.value['mail'];
  }
}
