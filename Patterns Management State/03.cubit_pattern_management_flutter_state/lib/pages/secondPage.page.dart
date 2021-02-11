import 'package:estado_singleton_flutter/bloc/usuario/usuario.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text(
                "Set user data",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final user =
                    new User(name: 'Dario', age: 27, hobbies: 'Soccer Life');
                BlocProvider.of<UsuarioCubit>(context).usuarioActivo(user);
              },
            ),
            RaisedButton(
              child: Text(
                "Change Age",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UsuarioCubit>(context).setNewAge(22);
              },
            ),
          ],
        ),
      )),
    );
  }
}
