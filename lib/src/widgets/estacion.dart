import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/models/clima_models.dart';
import 'package:flutter_proyecto_cicata/src/models/estaciones_models.dart';
import 'package:flutter_proyecto_cicata/src/services/service.dart';
import 'package:provider/provider.dart';
//     final newsResponse = newsResponseFromJson(jsonString);

import 'Dart:math';

class Estacion extends StatelessWidget {
  final List<RespuestaEstacion> noticias;

  const Estacion(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estaciónnnnnnn"),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.backspace),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
        body: ListView.builder(
            itemCount: this.noticias.length,
            itemBuilder: (BuildContext context, int index) {
              return _Noticia(noticia: this.noticias[index], index: index);
            }));
  }
}

class _Noticia extends StatelessWidget {
  final RespuestaEstacion noticia;
  final int index;
  final Estaciones pressid;

  const _Noticia({@required this.noticia, @required this.index, this.pressid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Tarjeta(noticia),
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _CuerpoEstacion(noticia),
        // _TarjetaBody(noticia),
        _TarjetaBotones(noticia),
        SizedBox(height: 80),
        Divider(),
        _TarjetaMedidas(noticia)
      ],
    );
  }
}

Queue<double> siguiente = new Queue<double>();

class _TarjetaMedidas extends StatelessWidget {
  final RespuestaEstacion noticia;

  const _TarjetaMedidas(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () {
            /// calculas el new cast
            // var count = 0;
            // int contador = 0;
            // final newsService =
            //     Provider.of<NewsService>(context, listen: false);

            // print('Fue presionado el boton');

            // final Stream myStream =
            //     new Stream.periodic(Duration(minutes: 5), (_) => count++);
            // print('................................................');
            // getMedida() async {
            //   await myStream
            //       .map((val) {
            //         count = val;
            //         contador = contador + 1;

            //         print('muestra No. $contador:  fecha: ${DateTime.now()}');
            //         newsService.selectedId = noticia.idx;

            //         var pm25 = newsService.estacion2.last.iaqi.pm10;
            //         siguiente.add(pm25.v);
            //         print(pm25.v);

            //         var carbonMonoxyde = newsService.estacion2.last.iaqi.pm10;
            //         print(carbonMonoxyde.v.toString() + ': PM10');

            //         var relativeHumidity = newsService.estacion2.last.iaqi.o3;
            //         print(relativeHumidity.v.toString() + ': O3 ');

            //         var n = newsService.estacion2.last.iaqi.no2;
            //         print(n.v.toString() + ': NO2 ');

            //         var o = newsService.estacion2.last.iaqi.so2;
            //         print(o.v.toString() + ': SO2');

            //         var p = newsService.estacion2.last.iaqi.co;
            //         print(p.v.toString() + ': CO');
            //         var t = newsService.estacion2.last.iaqi.t;
            //         print(t.v.toString() + ': TEMP');

            //         var pm10 = newsService.estacion2.last.iaqi.p;
            //         print(pm10.v.toString() + ': PRESSURE ');

            //         var d = newsService.estacion2.last.iaqi.h;
            //         print(d.v.toString() + ': HUMIDITY');

            //         var w = newsService.estacion2.last.iaqi.w;
            //         print(w.v.toString() + ':WIND Wind');
            //         // var r = newsService.estacion.first.iaqi.;
            //         // print(w.v.toString() + ':rain');

            //         print(siguiente);
            //         print('Sigue trabajando...');

            //         print('...........................');
            //         return val;
            //       })
            //       .take(12)
            //       .forEach((e) {
            //         // print(e);
            //       });
            //   var cmax = siguiente.reduce(max);
            //   var cmin = siguiente.reduce(min);
            //   print('numero de muestras: ' + siguiente.length.toString());

            //   print('maximo: ' + cmax.toString());
            //   print('minimo: ' + cmin.toString());

            //   double dobleu = cmin / cmax;

            //   double potencia = 0.5;
            //   double nowCast = 0;
            //   double resultado = 0;
            //   if (dobleu <= 0.5) {
            //     for (int i = 0; i <= 11; i++) {
            //       nowCast = ((0.5 * potencia) * siguiente.last) / 0.5;
            //       resultado = resultado + nowCast;
            //       print('nowCast nuevo: ');

            //       print(nowCast.toString());
            //       print('potencia: ' + potencia.toString());
            //       potencia = potencia * 0.5;
            //     }
            //     print('nowCast <= : ' + resultado.toString());
            //   } else if (dobleu > 0.5) {
            //     for (int i = 0; i <= 10; i++) {
            //       nowCast = ((dobleu * potencia) * siguiente.first) / dobleu;
            //       resultado = resultado + nowCast;

            //       print('...... ');
            //       print('nowCast nuevo: ');

            //       print(nowCast.toString());
            //       print('potencia: ' + potencia.toString());
            //       print('c' + i.toString() + ': ' + siguiente.last.toString());
            //       potencia = potencia * 0.5;
            //     }
            //     print('nowCast > : ' + resultado.toString());
            //   }
            //   print('doblwu: ' + dobleu.toString());
            //   siguiente.toList();
            // }

            // getMedida();
          },
        ),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final RespuestaEstacion noticia;

  const _TarjetaBotones(this.noticia);
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);

    var pm10 = double.parse(noticia.pm10);
    var ppm10 = (pm10).toStringAsFixed(1);

    var pm1 = double.parse(noticia.pm1);
    var ppm1 = (pm1).toStringAsFixed(1);

    var pm25 = double.parse(noticia.pm25);
    var ppm25 = (pm25).toStringAsFixed(1);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Text(
                  'Estacion No. ' + noticia.id.toString(),
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.red[900],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Sensor',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Medida',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Componente',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      if (double.parse(noticia.pm10) != null)
                        DataCell(Text('PM10',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]))),
                      DataCell(Text('' + ppm10.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      if (double.parse(noticia.pm25) != null)
                        DataCell(Text('PM2.5',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]))),
                      DataCell(
                        Text('' + ppm25.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      DataCell(Text('(AQI)')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      if (double.parse(noticia.pm1) != null)
                        DataCell(Text('Pm1',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]))),
                      DataCell(Text(ppm1.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('PM1')),
                    ],
                  ),
                ],
              ),

              ////////////
            ],
          ),

          ////medidas
        ],
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {
  final RespuestaEstacion noticia;

  const _Tarjeta(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Declaramos e inicializamos el máximo.

        // prints true

        if (double.parse(noticia.pm25) < 50)
          Card(
            color: Colors.green,
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.cloud_done, color: Colors.white, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                  title: Text('Calidad del aire buena 0-50',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.green[50])),
                  subtitle: Text(
                    'La calidad del aire se considera satisfactoria y la contaminación del aire presenta poco o ningún riesgo.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
        else

        ///
        if (double.parse(noticia.pm25) <= 100)
          Card(
            color: Colors.yellowAccent,
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.accessibility_new,
                          color: Colors.black87, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87)),
                    ],
                  ),
                  title: Text('Calidad del aire moderada 51-100',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.black87)),
                  subtitle: Text(
                    'Aceptable; para algunos contaminantes puede haber un problema de salud moderado para un número muy pequeño de personas que son inusualmente sensibles a la contaminación del aire.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
        else

        ///
        if (double.parse(noticia.pm25) <= 150)
          Card(
            color: Colors.orange[800],
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.group_work_rounded,
                          color: Colors.white, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  title: Text('Calidad nociva para grupos sensibles 101-150',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.white)),
                  subtitle: Text(
                    'Los miembros de grupos sensibles pueden experimentar efectos sobre la salud. No es probable que el público en general se vea afectado.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
        else if (double.parse(noticia.pm25) <= 200)
          Card(
            color: Colors.red,
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.close_rounded,
                          color: Colors.white, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  title: Text('Calidad nociva 151-200',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.white)),
                  subtitle: Text(
                    'Todos pueden comenzar a experimentar efectos sobre la salud; los miembros de grupos sensibles pueden experimentar efectos de salud más graves',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
        else if (double.parse(noticia.pm25) <= 300)
          Card(
            color: Colors.purple[600],
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.cloud_off, color: Colors.white, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  title: Text('Calidad muy nociva 201-300',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.white)),
                  subtitle: Text(
                    'Advertencias sanitarias de situaciones de emergencia. Es más probable que toda la población se vea afectada.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
        else if (double.parse(noticia.pm25) >= 300)
          Card(
            color: Colors.red[900],
            elevation: 30.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    children: <Widget>[
                      Icon(Icons.dangerous, color: Colors.white, size: 35.0),
                      Text('' + noticia.pm25.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white))
                    ],
                  ),
                  title: Text('Calidad peligrosa 300+',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.white)),
                  subtitle: Text(
                    'Alerta de salud: todos pueden experimentar efectos de salud más graves',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      height: 1,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7.0),
              ],
            ),
          )
      ],
    );
  }

  // calcular aqi

}

class _TarjetaTitulo extends StatelessWidget {
  final RespuestaEstacion noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    var temperatura = double.parse(noticia.temperatura);

    var ttemperatura = (temperatura).toStringAsFixed(0);
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Text(
            noticia.estacion,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 34,
              color: Colors.purple[900],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text.rich(
          TextSpan(
            text: ' ', // default text style
            children: <TextSpan>[
              TextSpan(
                  text: ' ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    color: Colors.blue[900],
                  )),
              TextSpan(
                text: '${ttemperatura.toString()} °C ',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 50,
                    color: Colors.purple[600]),
              ),
            ],
          ),
        ),
        // Card(
        //   color: Colors.red,
        //   elevation: 30.0,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        //   child: Column(
        //     children: <Widget>[_crearBoton()],
        //   ),
        // )
      ],
    );
  }

  // print(lista[0].reduce(min)); // 1
  // Lista de números enteros que supondremos  .

  //   double maximo = lista[0]; // Declaramos e inicializamos el máximo.
  //   double minimo = lista[0];
  //   // Declaramos e inicializamos el máximo.
  // //returns 1

  //   for (int i = 0; i < 12; i++) {
  //     if (maximo <= lista[i]) maximo = lista[i];
  //     if (minimo >= lista[i]) minimo = lista[i];
  //   }

}

class _CuerpoEstacion extends StatelessWidget {
  final RespuestaEstacion noticia;

  const _CuerpoEstacion(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Column(
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                  text: ' Fecha: ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    color: Colors.purple[900],
                  ),
                ),
                TextSpan(
                  text: '${noticia.fecha.toString()} ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final RespuestaEstacion noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    // (noticia.iaqi.co.v).toStringAsFixed(0);
    // (noticia.iaqi.h.v).toStringAsFixed(0);
    // (noticia.iaqi.no2.v).toStringAsFixed(0);
    // (noticia.iaqi.o3.v).toStringAsFixed(0);
    // (noticia.iaqi.p.v).toStringAsFixed(0);
    // (noticia.iaqi.pm10.v).toStringAsFixed(0);
    // (noticia.iaqi.pm25.v).toStringAsFixed(0);
    // (noticia.iaqi.so2.v).toStringAsFixed(0);
    // (noticia.iaqi.t.v).toStringAsFixed(0);
    // (noticia.iaqi.w.v).toStringAsFixed(0);
    // (noticia.iaqi.wg.v).toStringAsFixed(0);

    // List<dynamic> lista = new List();
    // lista
    //   ..add(noticia.iaqi.co.v)
    //   ..add(noticia.iaqi.h.v)
    //   ..add(noticia.iaqi.no2.v)
    //   ..add(noticia.iaqi.o3.v)
    //   ..add(noticia.iaqi.p.v)
    //   ..add(noticia.iaqi.pm10.v)
    //   ..add(noticia.iaqi.pm25.v)
    //   ..add(noticia.iaqi.so2.v)
    //   ..add(noticia.iaqi.t.v)
    //   ..add(noticia.iaqi.w.v)
    //   ..add(noticia.iaqi.wg.v);

    print([1, 2, 8, 6].reduce(min)); // 1

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      margin: EdgeInsets.only(bottom: 3),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
