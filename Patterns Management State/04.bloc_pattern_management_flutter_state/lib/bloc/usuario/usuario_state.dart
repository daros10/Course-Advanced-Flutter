part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final User usuario;

  UsuarioState({User user})
      : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;
}
