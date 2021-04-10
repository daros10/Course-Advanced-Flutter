import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_app/models/pokemon_first_fetch.dart';
import 'package:pokedex_app/services/pokemon_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState());

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    if (event is FetchPokemonData) {
      final PokemonService pokemonService = new PokemonService(Dio());
      final pokemonData = await pokemonService.firstFetchPokemon();

      yield PokemonState(isLoading: false, pokemonData: pokemonData);
    }
  }
}
