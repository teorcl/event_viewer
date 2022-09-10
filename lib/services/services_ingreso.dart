import 'dart:convert';
import 'package:http/http.dart' as http;
import '../user_preferences/user_preferences.dart';

class IngresoServices {
  final prefs = PreferenciasUsuario();
  //PreferenciasUsuario prefs = PreferenciasUsuario();
  final ip = "http://sistemic.udea.edu.co:4000";

  //Método para el consumo del serivicio de logeo
  Future login(String usuario, String password) async {
    var headers = {
      'Authorization': 'Basic Zmx1dHRlci1yZXRvOnVkZWE=',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/autenticacion/oauth/token'));
    request.bodyFields = {
      'username': usuario,
      'password': password,
      'grant_type': 'password'
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      final Map<String, dynamic> decodedData = json.decode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        prefs.token = decodedData["access_token"];
        print(prefs.token);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  Future register(String username, String pass, String email) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$ip/reto/usuarios/registro/enviar'));
    
    request.body = json.encode(
        { "username": username, 
          "password": pass, 
          "email": email
        }
      );
    
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future otp(String code, String username) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$ip/reto/usuarios/registro/confirmar/$username'));
    request.fields.addAll({'codigo': code});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
