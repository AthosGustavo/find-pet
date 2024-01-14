import 'dart:io';

import 'package:find_pet/screens/details_screen.dart';
import 'package:flutter/material.dart';

class CardRegistro extends StatefulWidget {
  late final String nome;
  late final String numero;
  late final String endereco;
  late final String nomePet;
  late final String enderecoVistoPorUltimo;
  late final File imgPet;
  File? imgUltimoLugarVisto;

  CardRegistro(DataForm) {
    this.nome = DataForm.nome;
    this.numero = DataForm.numero;
    this.endereco = DataForm.endereco;
    this.nomePet = DataForm.nomePet;
    this.enderecoVistoPorUltimo = DataForm.enderecoVistoPorUltimo;
    this.imgPet = DataForm.imgPet;
    
    if(DataForm.imgUltimoLugarVisto != null){
      this.imgUltimoLugarVisto = DataForm.imgUltimoLugarVisto;  
    }
    
  }

  @override
  _CardRegistro createState() => _CardRegistro();
}

class _CardRegistro extends State<CardRegistro> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      nome: widget.nome,
                      numero: widget.numero,
                      endereco: widget.endereco,
                      nomePet: widget.nomePet,
                      enderecoVistoPorUltimo: widget.enderecoVistoPorUltimo,
                      imgPet: widget.imgPet,
                      imgUltimoLugarVisto: widget.imgUltimoLugarVisto,


                  )
              )
          );
        },
        child: Ink(
          height: 220,
          width: 280,
          padding:
              EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
          // /margin: EdgeInsets.all(8.0), // Adiciona uma margem externa
          decoration: BoxDecoration(
            color: Colors.blue, // Cor de fundo azul
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha o texto à esquerda
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    image: widget.imgPet != null
                        ? DecorationImage(
                            image: FileImage(widget.imgPet!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  )),
              Text(widget.nomePet),
              Text(widget.enderecoVistoPorUltimo),
            ],
          ),
        ),
      ),
    ]);
  }
}
