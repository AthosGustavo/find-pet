import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginService {
  static const String apiUrl = "http://192.168.0.108:8080";

  Uri getUri(String endpoint){
    var apiUri = Uri.parse("${apiUrl}${endpoint}");
    return apiUri;
  }

  Future loginUser(String email, String senha)async{
    final Map<String, dynamic> dadosLogin = {
      "email":email,
      "senha":senha
    };

    final response = await http.post(
      getUri("/login"),
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

