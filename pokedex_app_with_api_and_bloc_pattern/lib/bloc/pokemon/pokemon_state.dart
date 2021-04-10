part of 'pokemon_bloc.dart';

class PokemonState {
  final bool isLoading;
  final PokemonFirstFetch pokemonData;

  PokemonState({
    this.isLoading = true,
    this.pokemonData,
  });
}
