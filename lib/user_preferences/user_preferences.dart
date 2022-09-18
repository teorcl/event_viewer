import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() { //Esto se hace para que al instanciar preferencia de usuario
    return _instancia;            //en cualquier parte siemore me retorne la misma instancia 
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  String get token {
    return _prefs.getString('token') ?? "";
  }
}
