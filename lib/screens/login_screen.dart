import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Texto'),
      ),
      body: Container(
        width:370,
        padding: EdgeInsets.all(16.0),
        child: Form(
          
          child: ListView(
            
            children: [
              TextFormField(
                
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                  ),
                decoration:InputDecoration(
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(int.parse('0xFFADBBB0')), width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(int.parse('0xFF7C8A7F')), width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(int.parse('0xFF132C29'))
                  ),
                  hintText: 'Digite o seu nome',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  floatingLabelBehavior: FloatingLabelBehavior.always
                )
              )
              
            ],
          ),
        ),
      ),
    );
  }

}