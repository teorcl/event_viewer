import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('udea.edu.co'),
            accountEmail: const Text('udea@udea.edu.co'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("udea.png",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 181, 213, 240),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("profileBackground.jpg")),
            ),
          ),
          Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.greenAccent[100],
            child: SizedBox(
              width: 310,
              height: 490,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.car_crash),
                    title: Text('Perfil'),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: Icon(Icons.fireplace_outlined),
                    title: Text('Contactos'),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: Icon(Icons.storm_outlined),
                    title: Text('XXXXXXX'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configuración'),
                    onTap: () => null,
                  ),
                  Divider(),
                ])
              )
            ),
          )
        ],
      ),
    );
  }
}