

import 'package:flutter/material.dart';

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
            ElevatedButton(onPressed: (){

              DataForm dataForm = DataForm(inputNomeController.text, inputNumeroController.text, inputEnderecoController.text, inputNomePetController.text);
              widget.formDataController.adicionaPet(dataForm);  // widget é usado para se referir a propriedades que sao passadas de pai para filho
              Navigator.pop(context,  widget.formDataController);
              
              
              // print(widget.formDataController.listaRegistros[0].nome);
              // print(widget.formDataController.listaRegistros[0].numero);
              // print(widget.formDataController.listaRegistros[0].endereco);
              // print(widget.formDataController.listaRegistros[0].nomePet);

              }, 
              child: Text('Registrar')
            )
            
          ]
        )
      ),
    );
  }
}