import 'package:ejemplos/models/persona_model.dart';
import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  final PersonaModel personaModel;

  const ItemLista(this.personaModel);

  @override
  Widget build(BuildContext context) {
    switch (personaModel.sexo) {
      case Sexo.masculino:
        return _Item(
            icono: Icons.male,
            nombre: this.personaModel.nombre,
            edad: this.personaModel.edad);
      case Sexo.femenino:
        return _Item(
            icono: Icons.female,
            nombre: this.personaModel.nombre,
            edad: this.personaModel.edad);
      default:
        return _Item(
            icono: Icons.transgender,
            nombre: this.personaModel.nombre,
            edad: this.personaModel.edad);
    }
  }
}

class _Item extends StatelessWidget {
  final IconData icono;
  final String nombre;
  final int edad;

  const _Item({required this.icono, required this.nombre, required this.edad});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.nombre),
      subtitle: Text('${this.edad}'),
      leading: Icon(this.icono),
    );
  }
}
