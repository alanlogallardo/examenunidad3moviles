class Usuario {
  Usuario({
    required this.nombre,
    required this.categoria,
    required this.id,
  });

  int id;
  String nombre;
  String categoria;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"], nombre: json["nombre"], categoria: json["categoria"]);
}
