import 'package:flutter/material.dart';

import '../models/evento_model.dart';
import '../services/services_ingreso.dart';

class Eventos extends StatelessWidget {
  const Eventos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventos"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.teal,
      ),

      /**BODY**/
      body: _crearListado(),
    );
  }


  _crearListado() {
    //Aquí creo la lista de eventos
    return FutureBuilder(
      future: IngresoServices().getEvento(),
      //initialData: InitialData,
      builder: (
                  BuildContext context,  
                  AsyncSnapshot <List<EventoModel>> snapshot
                ) {
                  if (snapshot.hasData){
                    print("=======================");
                    final enventos = snapshot.data;
                    return ListView.builder(
                      itemCount: enventos!.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: Column(
                            children: [
                              /*FadeInImage(
                                width: double.infinity,
                                height: 300,
                                placeholder: const AssetImage("assets/foto.png"), 
                                image: NetworkImage(enventos[index].image),
                                fit: BoxFit.cover,
                              ),*/

                              Text(enventos[index].eventDescription),
                              Text(enventos[index].comment),
                              Text(enventos[index].userId)
                          ]),
                        );
                      });
                  }else{
                    return const CircularProgressIndicator();
                  }
        
      },
    );
  }

}

