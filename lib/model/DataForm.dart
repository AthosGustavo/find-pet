
import 'dart:io';

import 'package:image_picker/image_picker.dart';
class DataForm{

  String nome;
  String numero;
  String endereco;
  String nomePet;
  File? fotoDoPet;

  DataForm({required this.nome, required this.numero, required this.endereco, required this.nomePet, required this.fotoDoPet});


}