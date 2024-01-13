

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
  File? imagemSelecionada;
  
  Future<void> adicionarImagemPet()async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState((){
      if(pickImage != null){
        imagemSelecionada = File(pickImage.path);
      }else{
        //lança exceçao
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
        child:Column(
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
            InkWell(
              onTap:(){
                adicionarImagemPet();
              },
              child: Ink(
                width:double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: imagemSelecionada != null
                    ? DecorationImage(
                        image: FileImage(imagemSelecionada!),
                        fit: BoxFit.cover,
                      )
                    : null,
                    
                  ),
                ),
            ),
            ElevatedButton(onPressed: (){

              DataForm dataForm = DataForm(nome:inputNomeController.text, numero:inputNumeroController.text, endereco:inputEnderecoController.text, nomePet:inputNomePetController.text, fotoDoPet:imagemSelecionada);
              widget.formDataController.adicionaPet(dataForm);  // widget é usado para se referir a propriedades que sao passadas de pai para filho
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