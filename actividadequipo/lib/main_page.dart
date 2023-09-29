import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuario.dart';
import 'crear_nuevo_usuario.dart'; // Importa CrearUsuarioScreen desde el archivo correspondiente

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UsuariosProvider(),
      child: Forage(),
    ),
  );
}

class Forage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage',
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: ListView.builder(
        itemCount: usuariosProvider.usuarios.length,
        itemBuilder: (context, index) {
          final usuario = usuariosProvider.usuarios[index];
          return ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
            subtitle: Text('Edad: ${usuario.edad.toString()}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Abre la pantalla de creación de usuarios.
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CrearUsuarioScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
