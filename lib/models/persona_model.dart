class PersonaModel {
  String nombre;
  int edad;
  Sexo sexo;
  PersonaModel({required this.nombre, required this.edad, required this.sexo});
}

enum Sexo { masculino, femenino, no_binario }
