import 'package:dio/dio.dart';
import 'package:pokedex_app/models/pokemon_first_fetch.dart';

class PokemonService {
  final Dio client;
  final String baseUrl = "https://pokeapi.co/api/v2";

  PokemonService(this.client);

  Future<PokemonFirstFetch> firstFetchPokemon() async {
    final response = await this.client.get('$baseUrl/pokemon?limit=40');
    final json = response.data;
    final PokemonFirstFetch data = PokemonFirstFetch.fromJson(json);
    return data;
  }
}
