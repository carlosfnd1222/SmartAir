// To parse this JSON data, do
//
//     final respuestaEstacion = respuestaEstacionFromJson(jsonString);

import 'dart:convert';

RespuestaEstacion respuestaEstacionFromJson(String str) =>
    RespuestaEstacion.fromJson(json.decode(str));

String respuestaEstacionToJson(RespuestaEstacion data) =>
    json.encode(data.toJson());

class RespuestaEstacion {
  RespuestaEstacion({
    this.id,
    this.estacion,
    this.humedad,
    this.pm1,
    this.pm10,
    this.pm25,
    this.temperatura,
    this.fecha,
  });

  int id;
  String estacion;
  String humedad;
  String pm1;
  String pm10;
  String pm25;
  String temperatura;
  String fecha;

  factory RespuestaEstacion.fromJson(Map<String, dynamic> json) =>
      RespuestaEstacion(
        id: json["id"],
        estacion: json["Estacion"],
        humedad: json["Humedad"],
        pm1: json["PM_1"],
        pm10: json["PM_10"],
        pm25: json["PM_25"],
        temperatura: json["Temperatura"],
        fecha: json["Fecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Estacion": estacion,
        "Humedad": humedad,
        "PM_1": pm1,
        "PM_10": pm10,
        "PM_25": pm25,
        "Temperatura": temperatura,
        "Fecha": fecha,
      };
}
