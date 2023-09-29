import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Usuario {
  final String nombre;
  final int edad;

  Usuario({required this.nombre, required this.edad});
}

class UsuariosProvider with ChangeNotifier {
  final List<Usuario> _usuarios = [];

  List<Usuario> get usuarios => _usuarios;

  void agregarUsuario(Usuario usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }
}
