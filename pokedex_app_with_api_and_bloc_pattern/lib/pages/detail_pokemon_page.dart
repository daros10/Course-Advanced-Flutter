import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/badge.dart';

class DetailPokemonPage extends StatelessWidget {
  final String pokemonName;
  final int index;
  final Color color;

  const DetailPokemonPage(this.pokemonName, this.index, this.color);

  @override
  Widget build(BuildContext context) {
    final String upperName = pokemonName.substring(0, 1).toUpperCase();
    final String lowerName = pokemonName.substring(1);

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('$upperName$lowerName'),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            )),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                margin: EdgeInsets.only(top: 130),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: color.withOpacity(0.8),
                ),
                child: ContendDetailPokemon(),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ImagePokemon(index, color),
            ),
          ],
        ));
  }
}

class ContendDetailPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 90,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TypesPokemon(),
        Divider(
          color: Colors.white38,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class TypesPokemon extends StatelessWidget {
  const TypesPokemon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ["Grase", "Posion"]
            .map(
              (pokemonType) => Badge(pokemonType, 70, 30),
            )
            .toList(),
      ),
    );
  }
}

class ImagePokemon extends StatelessWidget {
  final int index;
  final Color color;

  const ImagePokemon(this.index, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Colors.black38,
              blurRadius: 2.0,
            )
          ]),
      child: CachedNetworkImage(
        imageUrl:
            'https://pokeres.bastionbot.org/images/pokemon/${index + 1}.png',
        placeholder: (context, url) => Container(
          width: 30,
          height: 30,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
