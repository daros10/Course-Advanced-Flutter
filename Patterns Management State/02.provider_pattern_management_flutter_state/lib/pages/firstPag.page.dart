import 'package:estado_singleton_flutter/services/user.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              userService.resetUser();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: userService.isUserInitialized
            ? Column(
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
                    title: Text("Nombre: ${userService.getUser.name}"),
                    leading: Icon(Icons.people),
                  ),
                  ListTile(
                    title: Text("Edad: ${userService.getUser.age}"),
                    leading: Icon(Icons.plus_one),
                  ),
                  ListTile(
                    title: Text("Hobbies: ${userService.getUser.hobbies}"),
                    leading: Icon(Icons.pool),
                  ),
                  Divider(),
                  Text(
                    "Skills",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // En las nuevas versiones de Dart y Fluter es posibles
                  // destrucuturar, casi como en React para renderizar iterables
                  ...userService.getUser.skills
                      .map((skill) => ListTile(
                            title: Text('$skill'),
                          ))
                      .toList()
                ],
              )
            : Center(
                child: Text('User not initiaized'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => {Navigator.pushNamed(context, "second")},
      ),
    );
  }
}
