import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex_app/widgets/pokemon_grid.dart';

class PokedexMain extends StatefulWidget {
  @override
  _PokedexMainState createState() => _PokedexMainState();
}

class _PokedexMainState extends State<PokedexMain> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context).add(FetchPokemonData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 96, 255, 0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          return state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PokemonGrid(state.pokemonData);
        },
      ),
    );
  }
}
