import 'package:find_pet/screens/initial_screen.dart';
import 'package:find_pet/services/login_service.dart';
import 'package:flutter/material.dart';

import '../componentes/input_decoration_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  
  bool login = true;
  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputSenhaController = TextEditingController();


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
                        controller: inputEmailController,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        decoration: InputDecorationLogin(
                          "E-mail", Icon(Icons.email),
                          hintText: "Digite o seu e-mail"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        controller: inputSenhaController,
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
                          onPressed: () async {
                            LoginService loginService = LoginService();
                            final response = await loginService.loginUser(inputEmailController.text,inputSenhaController.text);
                            
                            if(response["acesso"] == "negado"){
                              print(response["mensagem"]);
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return InitialScreen();
                                })
                              );
                            }

                          },
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
