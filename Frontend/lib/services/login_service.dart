import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  static const String apiUrl = "http://localhost:8080";

  Future loginUser(String email, String senha)async{
    final uri = Uri.parse("http://192.168.0.114:8080/login");
    
    final Map<String, dynamic> dadosLogin = {
      "email":email,
      "senha":senha
    };

    final response = await http.post(
      uri,
      body:jsonEncode(dadosLogin),
      headers: {
        'Content-Type': 'application/json', 
      },
    );

    if(response.statusCode == 200){
      print(response.statusCode);
      return jsonDecode(response.body);
    }else{
      return jsonDecode(response.body);
    }
  }


}

