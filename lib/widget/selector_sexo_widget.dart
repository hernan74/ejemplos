import 'package:flutter/material.dart';

class SelectorSexoWidget extends StatelessWidget {
  final String titulo;
  final Function onPressed;
  final bool seleccionado;

  const SelectorSexoWidget(
      {required this.titulo,
      required this.onPressed,
      required this.seleccionado});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => this.onPressed.call(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: this.seleccionado ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: size.height * 0.05,
        width: size.width * 30 / 100,
        alignment: Alignment.center,
        child: Text(this.titulo),
      ),
    );
  }
}
