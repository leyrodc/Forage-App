import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuario.dart';

class CrearUsuarioScreen extends StatefulWidget {
  @override
  _CrearUsuarioScreenState createState() => _CrearUsuarioScreenState();
}

class _CrearUsuarioScreenState extends State<CrearUsuarioScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _edadController,
              decoration: InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final nombre = _nombreController.text;
                final edad = int.tryParse(_edadController.text) ?? 0;

                if (nombre.isNotEmpty && edad > 0) {
                  final nuevoUsuario = Usuario(nombre: nombre, edad: edad);
                  usuariosProvider.agregarUsuario(nuevoUsuario);

                  // Limpiar los campos de texto
                  _nombreController.clear();
                  _edadController.clear();

                  // Mostrar un mensaje de éxito
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Usuario agregado con éxito.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  // Mostrar un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, completa todos los campos correctamente.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Agregar Usuario'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    super.dispose();
  }
}
