import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

part 'usuario.state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitialState());

  void usuarioActivo(User user) {
    emit(UsuarioActivo(user));
  }

  void setNewAge(int age) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.user.copyWith(age: age);
      emit(UsuarioActivo(newUser));
    }
  }
}
