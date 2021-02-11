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
              title: Text("Nombre: "),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Edad: "),
              leading: Icon(Icons.plus_one),
            ),
            ListTile(
              title: Text("Hobbies: "),
              leading: Icon(Icons.pool),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => {Navigator.pushNamed(context, "second")},
      ),
    );
  }
}
