

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget{

  late final String nome;
  late final String numero;
  late final String endereco;
  late final String nomePet;

  DetailsScreen({required this.nome, required this.numero, required this.endereco, required this.nomePet});


  _DetailsScreen createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen>{

  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text('Teste'),
      ),
      body:Column(
        children: [          
          Text(widget.nome),     
          Text(widget.numero),
          Text(widget.endereco),
          Text(widget.nomePet),
        ],
      )
    );
  }
}