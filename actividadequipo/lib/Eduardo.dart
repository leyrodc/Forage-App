import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuario.dart';
import 'package:actividadequipo/main_page.dart';
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
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main();

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      body: Consumer<UsuariosProvider>(
        builder: (context, usuariosProvider, child) {
          return ListView.builder(
            itemCount: usuariosProvider.usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuariosProvider.usuarios[index];
              return ListTile(
                title: Text('nombre: ${usuario.nombre}'),
                subtitle: Text('edad: ${usuario.edad}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Forage()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
