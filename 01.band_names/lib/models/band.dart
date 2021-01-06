class Band {
  String id;
  String name;
  int votes;

  Band({
    this.id,
    this.name,
    this.votes,
  });

  // factory constuctor, regresa una nueva instancion de la misma
  // clase, permitiendo asignar los valores de los atributos
  // mediante la data que se le enviara como parametro.
  factory Band.fromMap(Map<String, dynamic> obj) =>
      Band(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
