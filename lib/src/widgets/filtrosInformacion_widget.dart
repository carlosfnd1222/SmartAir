import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/models/clima_models.dart';

//MÉTODO PARA OBTENER LOS DATOS DE LAS ESTACIONES MEDIENTE LA REST API
Future<List<RespuestaEstacion>> getStationsData(List<int> data) async {
  List<RespuestaEstacion> datosEstaciones = [];

  for (var idStation in data) {
    var response = await http
        .get(Uri.parse("https://smartair.ngrok.io/api/medidas/$idStation"));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(body);
      //print(jsonData);
      datosEstaciones.add(RespuestaEstacion(
        id: jsonData['id'],
        estacion: jsonData['Estacion'],
        humedad: jsonData['Humedad'],
        pm1: jsonData['PM_1'],
        pm10: jsonData['PM_10'],
        pm25: jsonData['PM_25'],
        temperatura: jsonData['Temperatura'],
        fecha: jsonData['Fecha'],
      ));
    }
  }
  return datosEstaciones;
}
//FIN DEL MÉTODO

//MÉTODO PARA MOSTRAR LOS DATOS DE LAS ESTACIONES EN UNA LISTA DE WIDGETS
//SE RECOREN LOS ELEMENTOS DE LA LISTA(ESTACIONES) Y SE MUESTRAN SUS DATOS
//EN UNA TABLA
List<Widget> tableData(List<RespuestaEstacion> _listStations) {
  List<Widget> stationsWidget = [];
  for (var item in _listStations) {
    var humedad = double.parse(item.humedad).toStringAsFixed(2);
    var tem = double.parse(item.temperatura).toStringAsFixed(2);
    var pm1 = double.parse(item.pm1).toStringAsFixed(2);
    var pm10 = double.parse(item.pm10).toStringAsFixed(2);
    var pm25 = double.parse(item.pm25).toStringAsFixed(2);
    stationsWidget.add(
      Column(
        children: [
          Card(
            child: Column(
              children: [
                Center(
                  child: Table(
                    children: [
                      TableRow(
                        children: <Widget>[
                          Center(
                            child: Text(
                              item.estacion,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Fecha: ${item.fecha}',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Table(
                        border: TableBorder.all(
                          width: 1.0,
                        ),
                        children: [
                          TableRow(children: <Widget>[
                            Center(
                              child: Text('Humedad'),
                            ),
                            Center(
                              child: Text('°C'),
                            ),
                            Center(
                              child: Text('PM 1'),
                            ),
                            Center(
                              child: Text('PM 10'),
                            ),
                            Center(
                              child: Text('PM 25'),
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            Center(
                              child: Text((humedad)),
                            ),
                            Center(
                              child: Text(tem),
                            ),
                            Center(
                              child: Text(pm1),
                            ),
                            Center(
                              child: Text(pm10),
                            ),
                            Center(
                              child: Text(pm25),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
  return stationsWidget;
}
//FIN DEL MÉTODO