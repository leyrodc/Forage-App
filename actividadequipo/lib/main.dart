import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuario.dart';
import 'Eduardo.dart'; // Asegúrate de importar este archivo si es necesario.
import 'main_page.dart'; // Asegúrate de importar este archivo si es necesario.

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => UsuariosProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage',
      home: Forage(),
    );
  }
}
