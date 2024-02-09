import 'package:find_pet/componentes/card_registro.dart';
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

          return CardRegistro(dataForm);
          
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
            //if (result != null && result is int){
              setState(() { //O método setState nao aceita parametros
                listaRegistros.length;
                
                // Mesmo que o escopo do setState esteja vazio, o Flutter
                // percebe a mudança de estado e reconstrói automaticamente
                // o widget. Isso resulta na reconstrução do ListView.builder,
                // que por sua vez atualiza a lista de registros na interface
                // do usuário.

              });
            //}
          });
        },
        child: Icon(Icons.add),
      )
      
    );
  }
}