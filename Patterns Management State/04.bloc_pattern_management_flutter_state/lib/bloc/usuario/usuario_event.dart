part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivarUsuario extends UsuarioEvent {
  final User user;

  ActivarUsuario(this.user);
}

class CambiarEdad extends UsuarioEvent {
  final int edad;

  CambiarEdad(this.edad);
}
