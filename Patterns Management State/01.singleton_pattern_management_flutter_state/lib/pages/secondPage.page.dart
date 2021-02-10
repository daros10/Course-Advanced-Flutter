import 'package:estado_singleton_flutter/models/user.dart';
import 'package:estado_singleton_flutter/services/user.service.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.streamUser,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('${userService.getUserInformatio.name}')
                : Text('Second page');
          },
        ),
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
                final newUser =
                    new User(name: 'Dario', age: 27, hobbies: 'Soccer Life');

                userService.setUserInformation(newUser);
              },
            ),
            RaisedButton(
              child: Text(
                "Change Age",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userService.setNewAgeUser(25);
              },
            ),
          ],
        ),
      )),
    );
  }
}
