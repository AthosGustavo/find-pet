

import 'dart:io';

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  Future<void> adicionarImagemPet()async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState((){
      if(pickImage != null){
        imgPet = File(pickImage.path);
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

  bool validaImgPet(){
    bool registroPermitido;
    imgPet == null ? registroPermitido = false :registroPermitido = true;
    return registroPermitido;
  }
  
  @override
  Widget build(BuildContext contexto){

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar pet')
      ),
      body: Container(
        child:Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "O campo nome deve ser preenchido.";
                  }else if(value.length < 4){
                    return "O campo nome de conter no mínimo 4 letras";
                  }
                },
                controller: inputNomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value!.length < 11){
                    return "Digite o DDD e o seu número";
                  }
                },
                controller: inputNumeroController,
                decoration: InputDecoration(labelText: 'Número'),
              ),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "O campo endereço deve ser preenchido";
                  }else if(value.length < 10){
                    return "O campo endereço de conter no mínimo 10 caracteres";
                  }
                },
                controller: inputEnderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "O pet deve ter um nome";
                  }else if(value.length < 2){
                    return "O nome do pet de conter no mínimo 2 caracteres";
                  }
                },
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
                
                try{
                  
                  if(formKey.currentState!.validate()){

                    if(validaImgPet()){
                      if(imgUltimoLugarVisto != null){
                        DataForm dataForm = DataForm(nome:inputNomeController.text, numero:inputNumeroController.text, endereco:inputEnderecoController.text, nomePet:inputNomePetController.text, enderecoVistoPorUltimo: inputEnderecoVistoPorUltimoController.text, imgPet:imgPet, imgUltimoLugarVisto: imgUltimoLugarVisto);
                        widget.formDataController.adicionaPet(dataForm);  // widget é usado para se referir a propriedades que sao passadas de pai para filho
                      }else{
                        DataForm dataForm = DataForm(nome:inputNomeController.text, numero:inputNumeroController.text, endereco:inputEnderecoController.text, nomePet:inputNomePetController.text, enderecoVistoPorUltimo: inputEnderecoVistoPorUltimoController.text, imgPet:imgPet);
                        widget.formDataController.adicionaPet(dataForm);
                      }
                      Navigator.pop(context,  widget.formDataController);

                    }else{
                      print("A imagem do pet deve ser selecionada");
                      // A mensagem deve aparecer dentro de um alert
                    }
                    
                  }else{
                    print("Os campos obrigatórios precisam ser preenchidos");
                    // A mensagem deve aparecer dentro de um alert
                  }
                
                }on NoSuchMethodError catch(excep){
                  print("Erro ao acessar a instância de FormState:${excep}");
                  // A mensagem deve aparecer dentro de um alert
                }
                
                }, 
                child: Text('Registrar')
              )
              
            ]
          ),
        )
      ),
    );
  }
}