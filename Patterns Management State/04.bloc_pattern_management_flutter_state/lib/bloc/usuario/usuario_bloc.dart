import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield UsuarioState(user: event.user);
    } else if (event is CambiarEdad) {
      yield UsuarioState(user: state.usuario.copyWith(age: event.edad));
    }
  }
}
