import 'package:estado_singleton_flutter/bloc/usuario/usuario.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => {Navigator.pushNamed(context, "second")},
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitialState:
            return Text('Usuario no inicializado');
            break;
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).user);
          default:
            return Text('Unknown state :(');
        }

        // if (state is UsuarioInitialState) {
        //   return Center(
        //     child: Text('Usuario no inicializado'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.user);
        // }

        // return Center(
        //   child: Text('Unknown state :('),
        // );
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Nombre: ${usuario.name}"),
            leading: Icon(Icons.people),
          ),
          ListTile(
            title: Text("Edad: ${usuario.age}"),
            leading: Icon(Icons.plus_one),
          ),
          ListTile(
            title: Text("Hobbies: ${usuario.hobbies}"),
            leading: Icon(Icons.pool),
          ),
        ],
      ),
    );
  }
}
