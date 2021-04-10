import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String pokemonType;
  final double width;
  final double height;

  const Badge(this.pokemonType, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white12,
      ),
      child: Center(
          child: Text(
        '${this.pokemonType}',
        style: TextStyle(
          color: Colors.white,
        ),
      )),
    );
  }
}
