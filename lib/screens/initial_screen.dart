import 'package:find_pet/controller/form_data_controller.dart';
import 'package:find_pet/model/DataForm.dart';
import 'package:find_pet/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget{

  @override
  _InitialScreen createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen>{
  FormDataController formDataController = FormDataController();
  
  @override
  Widget build(BuildContext context){
    List<DataForm> listaRegistros = formDataController.listaRegistros;  
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar pet')
      ),
      body: ListView.builder( //estudar a sintaxe de ListView.builder
        itemCount: listaRegistros.length,
        itemBuilder: (BuildContext context, int index){
          DataForm dataForm = listaRegistros[index];

          return ListTile(
            title: Text('Nome: ${dataForm.nome}')
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
                return FormScreen(formDataController); //estudar sobre a necessidade de passar a instancia de formDataController no parametro de FormScreen
              }
            
            )
          ).then((result){ //ESTUDAR SOBRE THEN
            if (result != null && result is int){
              setState(() {
                
              });
            }
          });
        },
        child: Icon(Icons.add),
      )
      
    );
  }
}