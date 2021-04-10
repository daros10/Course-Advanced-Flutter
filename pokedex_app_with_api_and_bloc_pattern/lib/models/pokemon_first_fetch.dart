import 'dart:convert';

PokemonFirstFetch pokemonFirstFetchFromJson(String str) =>
    PokemonFirstFetch.fromJson(json.decode(str));

String pokemonFirstFetchToJson(PokemonFirstFetch data) =>
    json.encode(data.toJson());

class PokemonFirstFetch {
  PokemonFirstFetch({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PokemonFirstFetch.fromJson(Map<String, dynamic> json) =>
      PokemonFirstFetch(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class Result {
  Result({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
