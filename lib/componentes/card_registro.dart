


import 'package:flutter/material.dart';

class CardRegistro extends StatefulWidget{

  late final String nome;
  late final String numero;
  late final String endereco;
  late final String nomePet;

  CardRegistro(CardRegistro){
    this.nome = CardRegistro.nome;
    this.numero = CardRegistro.numero;
    this.endereco = CardRegistro.endereco;
    this.nomePet = CardRegistro.nomePet;
  }
  
  @override
  _CardRegistro createState() => _CardRegistro();
}

class _CardRegistro extends State<CardRegistro>{


  @override
  Widget build(BuildContext context){
    
    return Container(
      padding: EdgeInsets.all(16.0), // Adiciona um espaçamento interno
      margin: EdgeInsets.all(8.0), // Adiciona uma margem externa
      decoration: BoxDecoration(
        color: Colors.blue, // Cor de fundo azul
        borderRadius: BorderRadius.circular(10.0), // Borda arredondada
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
        mainAxisAlignment: MainAxisAlignment.center, 
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