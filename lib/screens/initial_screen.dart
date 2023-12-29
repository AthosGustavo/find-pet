


import 'package:find_pet/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget{

  @override
  _InitialScreen createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen>{

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar pet')
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return FormScreen();
            }
            
            )
          );
        },
        child: Icon(Icons.add),
      ),
      
    );
  }
}