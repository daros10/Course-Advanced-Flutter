import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  final String result;

  const ShowResult(this.result);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Text(
            "$result",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
