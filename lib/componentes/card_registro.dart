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

    if (DataForm.imgUltimoLugarVisto != null) {
      this.imgUltimoLugarVisto = DataForm.imgUltimoLugarVisto;
    }
  }

  @override
  _CardRegistroState createState() => _CardRegistroState();
}

class _CardRegistroState extends State<CardRegistro> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
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
                  ),
                ),
              );
            },
            child: Ink(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0,2),
                  )
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 5,
                        ),
                        color: Colors.grey[200],
                        image: widget.imgPet != null
                            ? DecorationImage(
                                image: FileImage(widget.imgPet!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(bottom:10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.pets, // Adicione um ícone que lembre um pet aqui
                              color: Colors.green,
                              size: 20.0,
                            ),
                            Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(widget.nomePet),
                          ),
                          ],
                        ),
                      ),
                      
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            
                            Icons.location_on, // Adicione um ícone de localização aqui
                            color: Colors.green,
                            size: 20.0,
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(widget.enderecoVistoPorUltimo),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
