

import 'dart:io';

import 'package:find_pet/componentes/card_registro.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/form_data_controller.dart';
import '../model/DataForm.dart';

class FormScreen extends StatefulWidget{
  final FormDataController formDataController;
  FormScreen(this.formDataController);


  @override
  _FormScreen createState() => _FormScreen();
}

class _FormScreen extends State<FormScreen>{
  
  TextEditingController inputNomeController = TextEditingController();
  TextEditingController inputNumeroController = TextEditingController();
  TextEditingController inputEnderecoController = TextEditingController();
  TextEditingController inputNomePetController = TextEditingController();
  TextEditingController inputEnderecoVistoPorUltimoController = TextEditingController();

  
  File? imgPet;
  File? imgUltimoLugarVisto;
  
  Future<void> adicionarImagemPet()async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState((){
      if(pickImage != null){
        imgPet = File(pickImage.path);
      }else{
        //lança exceçao
      }
    });
  }

  Future<void> adicionarImgVistoPorUltimo()async{
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState((){
      if(pickImage != null){
        imgUltimoLugarVisto = File(pickImage.path);
      }else{
        imgUltimoLugarVisto = null;
      }
    });
  }
  
  @override
  Widget build(BuildContext contexto){

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar pet')
      ),
      body: Container(
        child:ListView(
          children: [
            TextFormField(
              controller: inputNomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: inputNumeroController,
              decoration: InputDecoration(labelText: 'Número'),
            ),
            TextFormField(
              controller: inputEnderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextFormField(
              controller: inputNomePetController,
              decoration: InputDecoration(labelText: 'Nome do pet'),
            ),
            TextFormField(
              controller: inputEnderecoVistoPorUltimoController,
              decoration: InputDecoration(labelText: 'Visto por último em...'),
            ),
            InkWell(
              onTap:(){
                adicionarImagemPet();
              },
              child: Ink(
                width:double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: imgPet != null
                    ? DecorationImage(
                        image: FileImage(imgPet!),
                        fit: BoxFit.cover,
                      )
                    : null,
                    
                  ),
                ),
            ),
            InkWell(
              onTap:(){
                adicionarImgVistoPorUltimo();
              },
              child: Ink(
                width:double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: imgUltimoLugarVisto != null
                    ? DecorationImage(
                        image: FileImage(imgUltimoLugarVisto!),
                        fit: BoxFit.cover,
                      )
                    : null,
                    
                  ),
                ),
            ),
            ElevatedButton(onPressed: (){
              
              if(imgUltimoLugarVisto != null){
                DataForm dataForm = DataForm(nome:inputNomeController.text, numero:inputNumeroController.text, endereco:inputEnderecoController.text, nomePet:inputNomePetController.text, enderecoVistoPorUltimo: inputEnderecoVistoPorUltimoController.text, imgPet:imgPet, imgUltimoLugarVisto: imgUltimoLugarVisto);
                widget.formDataController.adicionaPet(dataForm);  // widget é usado para se referir a propriedades que sao passadas de pai para filho

              }else{
                DataForm dataForm = DataForm(nome:inputNomeController.text, numero:inputNumeroController.text, endereco:inputEnderecoController.text, nomePet:inputNomePetController.text, enderecoVistoPorUltimo: inputEnderecoVistoPorUltimoController.text, imgPet:imgPet);
                widget.formDataController.adicionaPet(dataForm);
              }
              Navigator.pop(context,  widget.formDataController);

              }, 
              child: Text('Registrar')
            )
            
          ]
        )
      ),
    );
  }
}