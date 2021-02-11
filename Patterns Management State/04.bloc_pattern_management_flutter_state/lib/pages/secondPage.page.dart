import 'package:flutter/material.dart';

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
              onPressed: () => {},
            ),
            RaisedButton(
              child: Text(
                "Change Age",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => {},
            ),
          ],
        ),
      )),
    );
  }
}
