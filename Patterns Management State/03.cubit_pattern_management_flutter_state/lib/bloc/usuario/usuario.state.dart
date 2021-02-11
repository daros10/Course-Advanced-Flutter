part of 'usuario.cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitialState extends UsuarioState {
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final User user;

  UsuarioActivo(this.user);
}
