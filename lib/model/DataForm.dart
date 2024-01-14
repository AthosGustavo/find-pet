
import 'dart:io';

import 'package:image_picker/image_picker.dart';
class DataForm{

  String nome;
  String numero;
  String endereco;
  String nomePet;
  String enderecoVistoPorUltimo;
  File? imgPet;
  File? imgUltimoLugarVisto;

  DataForm({required this.nome, required this.numero, required this.endereco, required this.nomePet, required this.enderecoVistoPorUltimo ,required this.imgPet, this.imgUltimoLugarVisto});


}