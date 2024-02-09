import 'package:flutter/material.dart';

import '../componentes/input_decoration_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical:10),
          child: Form(
            child: Center(
              
              child: SingleChildScrollView(
                child: Container(
                  width: 360,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        decoration: InputDecorationLogin(
                          "E-mail", Icon(Icons.email),
                          hintText: "Digite o seu e-mail"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        decoration: InputDecorationLogin(
                          "Senha", Icon(Icons.lock),
                          hintText: "Digite a sua senha"
                        ),
                        obscureText: true),
                      SizedBox(
                        height: 22,
                      ),
                      Visibility(
                        visible: !login,
                        child: Column(
                          children: [
                            TextFormField(
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                decoration: InputDecorationLogin(
                                  "Confirme", Icon(Icons.check_circle),
                                  hintText: "Repita a senha"
                                ),
                                obscureText: true),
                            SizedBox(height: 22,),
                            TextFormField(
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                              decoration: InputDecorationLogin(
                                "Nome", Icon(Icons.account_circle_rounded),
                                hintText: "Digite o seu nome"
                              ),
                            ),
                            SizedBox(height: 22,),
                          ],
                      )),    
                      SizedBox(
                        //SizedBox foi usado para aumentar a largura do botao
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Entrar'),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              login = !login;
                            });
                          },
                          child: Text((login)
                              ? 'Ainda não tem uma conta? Cadastre-se'
                              : 'Já tem uma conta? Entre'))
                    ]),
                ),
              )
            ),
          ),
        ));
  }
}
