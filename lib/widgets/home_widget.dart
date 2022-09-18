import 'package:event_viewer/widgets/button_navigation_widget.dart';
import 'package:event_viewer/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});



  @override
  Widget build(BuildContext context) {

    

    return   Scaffold(
      drawer: NavBar(),
      appBar: AppBar(title: const Text("Visualizador de eventos", style: TextStyle(color: Colors.black12),),
        backgroundColor: Color.fromARGB(255, 90, 141, 192),
        centerTitle: true,),
      body: MyStatefulWidget(),
    
    );
  }



}

