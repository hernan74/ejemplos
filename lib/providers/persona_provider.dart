import 'dart:async';

import 'package:ejemplos/models/persona_model.dart';

class PersonaProvider {
  static final PersonaProvider _personaProvider = new PersonaProvider._();

  PersonaProvider._();

  factory PersonaProvider() {
    return _personaProvider;
  }

  static final StreamController<List<PersonaModel>> _streamPersonaController =
      new StreamController.broadcast();
  List<PersonaModel> lista = [];
  static Stream<List<PersonaModel>> get streamUsersController =>
      _streamPersonaController.stream;

  void limpiarLista() {
    _streamPersonaController.sink.add(List.empty());
  }

  void cargarListado(List<PersonaModel> lista) {
    this.lista = [];
    this.lista.addAll(lista);
    _streamPersonaController.sink.add(this.lista);
  }

  String agregar(String nombre, String edad, Sexo sexo) {
    if (nombre.isEmpty) {
      return 'Ingrese un nombre';
    } else if (edad.isEmpty || int.tryParse(edad) == null) {
      return 'Ingrese una edad';
    }
    final persona =
        new PersonaModel(nombre: nombre, edad: int.parse(edad), sexo: sexo);
    this.lista.add(persona);
    _streamPersonaController.sink.add(this.lista);

    return '';
  }

  dispose() {
    _streamPersonaController.close();
  }
}
