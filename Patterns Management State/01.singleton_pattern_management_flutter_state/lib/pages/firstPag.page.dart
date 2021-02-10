import 'package:estado_singleton_flutter/models/user.dart';
import 'package:estado_singleton_flutter/services/user.service.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: StreamBuilder(
            stream: userService.streamUser,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              return snapshot.hasData
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
                          title: Text(
                              "Nombre: ${userService.getUserInformatio.name}"),
                          leading: Icon(Icons.people),
                        ),
                        ListTile(
                          title: Text(
                              "Edad: ${userService.getUserInformatio.age}"),
                          leading: Icon(Icons.plus_one),
                        ),
                        ListTile(
                          title: Text(
                              "Hobbies: ${userService.getUserInformatio.hobbies}"),
                          leading: Icon(Icons.pool),
                        ),
                      ],
                    )
                  : Center(
                      child: Text('User is not initialized'),
                    );
            },
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => {Navigator.pushNamed(context, "second")},
      ),
    );
  }
}
