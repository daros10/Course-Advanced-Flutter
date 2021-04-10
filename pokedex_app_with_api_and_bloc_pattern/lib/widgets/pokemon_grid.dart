import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_first_fetch.dart';
import 'package:pokedex_app/pages/detail_pokemon_page.dart';
import 'package:pokedex_app/widgets/badge.dart';
import 'package:random_color/random_color.dart';

class PokemonGrid extends StatelessWidget {
  final PokemonFirstFetch pokemonList;

  const PokemonGrid(
    this.pokemonList,
  );

  @override
  Widget build(BuildContext context) {
    final List<Result> pokemonResults = pokemonList.results;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(pokemonResults.length, (index) {
            return PokemonCard(pokemonResults, index);
          }),
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final List<Result> pokemonResults;
  final int index;

  const PokemonCard(
    this.pokemonResults,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
      colorHue: ColorHue.blue,
    );

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPokemonPage(pokemonResults[index].name, index, _color),
          )),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: _color,
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                color: Colors.black38,
                blurRadius: 2.0,
              )
            ]),
        child: PokemonCardBody(pokemonResults, index),
      ),
    );
  }
}

class PokemonCardBody extends StatelessWidget {
  final List<Result> pokemonResults;
  final int index;

  const PokemonCardBody(this.pokemonResults, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CardHeader(pokemonResults, index),
          CardContent(index),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final int index;

  const CardContent(this.index);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Badge(
              "${index + 1}",
              45,
              25,
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        PokemonImage(index)
      ],
    );
  }
}

class PokemonImage extends StatelessWidget {
  final int index;

  const PokemonImage(this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 50,
        height: 100,
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
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final List<Result> pokemonResults;
  final int index;

  const CardHeader(this.pokemonResults, this.index);
  @override
  Widget build(BuildContext context) {
    final String upperName =
        pokemonResults[index].name.substring(0, 1).toUpperCase();
    final String lowerName = pokemonResults[index].name.substring(1);

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "$upperName$lowerName",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
