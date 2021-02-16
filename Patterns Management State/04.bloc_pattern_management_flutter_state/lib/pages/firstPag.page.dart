import 'package:estado_singleton_flutter/bloc/usuario/usuario_bloc.dart';
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
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return Body(state.usuario);
          } else {
            return Center(
              child: Text("NO HAY UN USUARIO SELECCIONADO"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => {Navigator.pushNamed(context, "second")},
      ),
    );
  }
}

class Body extends StatelessWidget {
  final User user;

  const Body(this.user);

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
            title: Text("Nombre: ${user.name}"),
            leading: Icon(Icons.people),
          ),
          ListTile(
            title: Text("Edad: ${user.age}"),
            leading: Icon(Icons.plus_one),
          ),
          ListTile(
            title: Text("Hobbies: ${user.hobbies}"),
            leading: Icon(Icons.pool),
          ),
        ],
      ),
    );
  }
}
