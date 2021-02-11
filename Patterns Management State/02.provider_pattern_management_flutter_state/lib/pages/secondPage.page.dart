import 'package:estado_singleton_flutter/services/user.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

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
                final user = new User(
                    name: 'Dario',
                    age: 27,
                    hobbies: 'Soccer life',
                    skills: ['sleep', 'eat']);

                userService.serUserInformation = user;
              },
            ),
            RaisedButton(
              child: Text(
                "Change Age",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userService.changeEdad(22);
              },
            ),
          ],
        ),
      )),
    );
  }
}
