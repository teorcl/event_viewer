import 'package:event_viewer/pages/login_page.dart';
import 'package:event_viewer/pages/otp_page.dart';
import 'package:event_viewer/pages/sigin_page.dart';
import 'package:event_viewer/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "login",
      routes: {
        "login": (context) => const LoginPage(),
        "register": (context) => const SiginPage(),
        "otp": (context) => const OTPPage(),
      },
    );
  }
}
