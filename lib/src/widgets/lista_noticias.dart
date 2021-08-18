import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/services/service.dart';
import 'package:flutter_proyecto_cicata/src/models/estaciones_models.dart';
import 'package:flutter_proyecto_cicata/src/pages/tab1_page_estacion.dart';
import 'package:provider/provider.dart';

class ListaNoticias extends StatelessWidget {
  final List<Estaciones> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estaciones1"),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.login_outlined),
          //     onPressed: () =>
          //         Navigator.pushNamed(context, 'login').then((context) {
          //       setState(() {});
          //     }),
          //   ),
          // ],
        ),
        body: ListView.builder(
            itemCount: this.noticias.length,
            itemBuilder: (BuildContext context, int index) {
              return _Noticia(noticia: this.noticias[index], index: index);
            }));
  }
}

class _Noticia extends StatelessWidget {
  final Estaciones noticia;
  final int index;
  final Estaciones pressid;

  const _Noticia({@required this.noticia, @required this.index, this.pressid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaBotones(noticia, index),
        SizedBox(height: 25),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Estaciones noticia;
  final int index;

  const _TarjetaBotones(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);
    getid() {
      newsService.selectedId = noticia.idEstacion;
    }

    return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: EdgeInsets.all(15),

      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 5,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Text(
            ' Estacion No. ${noticia.idEstacion} ',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.redAccent[100],
            ),
            textAlign: TextAlign.end,
          ),
          ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(' ' + noticia.nombre,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    color: Colors.purple[900],
                  )),
              subtitle: Text('Sistema: ${noticia.sistema} ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Colors.black54,
                  )),
              leading: Icon(
                Icons.account_tree_rounded,
                color: Colors.purple[700],
              )),
          SizedBox(height: 2.5),
          ListTile(
            title: Text(' ' + noticia.descripcion,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Colors.purple[900],
                )),
          ),
          Divider(),

          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: ' Geo: ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${noticia.ubicacion.toString()} ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Usamos una fila para ordenar los botones del card
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  getid();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (arguments) => Tab1PageEstacion()),
                  );
                },
                child: Text('Mostrar estacion',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.blue[900],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
