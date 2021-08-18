// To parse this JSON data, do
//
//     final Estaciones = EstacionesFromJson(jsonString);

import 'dart:convert';

List<Estaciones> estacionesFromJson(String str) =>
    List<Estaciones>.from(json.decode(str).map((x) => Estaciones.fromJson(x)));

String estacionesToJson(List<Estaciones> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Estaciones {
  Estaciones({
    this.idEstacion,
    this.nombre,
    this.ubicacion,
    this.descripcion,
    this.sistema,
  });

  int idEstacion;
  String nombre;
  String ubicacion;
  String descripcion;
  String sistema;

  factory Estaciones.fromJson(Map<String, dynamic> json) => Estaciones(
        idEstacion: json["IdEstacion"],
        nombre: json["Nombre"],
        ubicacion: json["Ubicacion"],
        descripcion: json["Descripcion"],
        sistema: json["Sistema"],
      );

  Map<String, dynamic> toJson() => {
        "IdEstacion": idEstacion,
        "Nombre": nombre,
        "Ubicacion": ubicacion,
        "Descripcion": descripcion,
        "Sistema": sistema,
      };
}
