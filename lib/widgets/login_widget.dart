import 'package:event_viewer/widgets/titulo_widget.dart';
import 'package:flutter/material.dart';

import '../services/services_ingreso.dart';
import '../user_preferences/user_preferences.dart';
import 'form_widget.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    print("PRIMEROOO: ${prefs.token}");
    final ingresoServices = IngresoServices();//Esto es como lo mismo que poner IngresoService myVariable = new IngresoService()
    //IngresoServices myVar = IngresoServices();
    //myVar.login(usuario, password)
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TituloWidget(mensaje: "Castillos Ingreso"),
              const Image(
                image: AssetImage("assets/logo.png"),
                width: 250,
              ),
              FormWidget(label: "Username", controllerText: userController),
              FormWidget(
                  label: "Password",
                  controllerText: passController,
                  obscure: true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen),
                        onPressed: () {
                          if((userController.text).isEmpty || (passController.text).isEmpty){
                              //print("Usuario o contraseña vacios");
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuario o contraseña vacios"),));
                          }else{
                            ingresoServices.login(
                                userController.text, 
                                passController.text
                              );
                          }
                        },
                        child: const Text("Login"))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No tienes cuenta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: const Text(
                        "Registrate",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
