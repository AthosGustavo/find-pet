import 'dart:io';

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  late final String nome;
  late final String numero;
  late final String endereco;
  late final String nomePet;
  String enderecoVistoPorUltimo;
  File? imgPet;
  File? imgUltimoLugarVisto;

  DetailsScreen(
      {required this.nome,
      required this.numero,
      required this.endereco,
      required this.nomePet,
      required this.enderecoVistoPorUltimo,
      required this.imgPet,
      this.imgUltimoLugarVisto});

  _DetailsScreen createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teste'),
        ),
        body: Column(
          children: [
            Text(widget.nome),
            Text(widget.numero),
            Text(widget.endereco),
            Text(widget.nomePet),
            Text(widget.enderecoVistoPorUltimo),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: widget.imgPet != null
                    ? DecorationImage(
                        image: FileImage(widget.imgPet!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: widget.imgUltimoLugarVisto != null
                    ? DecorationImage(
                        image: FileImage(widget.imgUltimoLugarVisto!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
          ],
        ));
  }
}
