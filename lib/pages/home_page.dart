import 'package:ejemplos/models/persona_model.dart';
import 'package:ejemplos/providers/persona_provider.dart';
import 'package:ejemplos/widget/item_lista.dart';
import 'package:ejemplos/widget/selector_sexo_widget.dart';
import 'package:flutter/material.dart';
import 'package:ejemplos/widget/textfield_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<PersonaModel> lista = [
      PersonaModel(nombre: 'Hernan', edad: 27, sexo: Sexo.masculino),
      PersonaModel(nombre: 'Juan', edad: 30, sexo: Sexo.masculino),
      PersonaModel(nombre: 'Laura', edad: 25, sexo: Sexo.femenino),
      PersonaModel(nombre: 'Pedro', edad: 22, sexo: Sexo.no_binario),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [_Formulario(), _Listado()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          PersonaProvider().cargarListado(lista);
        },
      ),
    );
  }
}

class _Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder<List<PersonaModel>>(
            stream: PersonaProvider().streamUsersController,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: Text('Sin datos'));

              return ListView(
                  children: snapshot.data!
                      .map((e) => InkWell(child: ItemLista(e)))
                      .toList());
            }));
  }
}

class _Formulario extends StatefulWidget {
  @override
  __FormularioState createState() => __FormularioState();
}

class __FormularioState extends State<_Formulario> {
  final nombreController = new TextEditingController();
  final edadController = new TextEditingController();
  final sexoController = new TextEditingController();
  late Sexo sexo = Sexo.masculino;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextfieldWidget(
              labelText: 'Nombre', controller: this.nombreController),
          TextfieldWidget(labelText: 'Edad', controller: this.edadController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectorSexoWidget(
                seleccionado: Sexo.masculino == sexo,
                titulo: 'Masculino',
                onPressed: () {
                  setState(() {
                    sexo = Sexo.masculino;
                  });
                },
              ),
              SelectorSexoWidget(
                seleccionado: Sexo.femenino == sexo,
                titulo: 'Femenino',
                onPressed: () {
                  setState(() {
                    sexo = Sexo.femenino;
                  });
                },
              ),
              SelectorSexoWidget(
                seleccionado: Sexo.no_binario == sexo,
                titulo: 'No Binario',
                onPressed: () {
                  setState(() {
                    sexo = Sexo.no_binario;
                  });
                },
              ),
            ],
          ),
          MaterialButton(
            height: MediaQuery.of(context).size.height * 0.055,
            color: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text('Agregar'),
            onPressed: () {
              PersonaProvider().agregar(
                  this.nombreController.text, this.edadController.text, sexo);
              setState(() {
                this.nombreController.text = '';
                this.edadController.text = '';
              });
            },
          )
        ],
      ),
    );
  }
}
