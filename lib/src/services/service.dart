import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_proyecto_cicata/src/models/category_model.dart';
import 'package:flutter_proyecto_cicata/src/models/clima_models.dart';
import 'package:flutter_proyecto_cicata/src/models/estaciones_models.dart';
import 'package:http/http.dart' as http;
export 'package:flutter_proyecto_cicata/src/bloc/productos_bloc.dart';

// ignore: non_constant_identifier_names
final _URL_NEWS = 'https://smartair.ngrok.io';

class NewsService with ChangeNotifier {
  List<Estaciones> headlines = [];
  List<RespuestaEstacion> estacion = [];
  List<RespuestaEstacion> estacion2 = [];

  String _selectedCategory = 'estacion';
  int _selectedId = 0;
  int _selectedIdPeticion = 0;
  int eleccion;
  bool _isLoading = true;
  bool _isLoading2 = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.tv, 'estacion'),
  ];

  Map<String, List<Estaciones>> categoryArticles = {};
  Map<dynamic, List<RespuestaEstacion>> listaid = {};

  NewsService({Key key, Widget child}) {
    //this.getTopHeadlines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = new List();
    });
    this.getArticlesByCategory(this._selectedCategory);
    print('celectCategory :' + _selectedCategory.toString());
  }

  bool get isLoading => this._isLoading;

  bool get isLoading2 => this._isLoading2;

//////////////DATA
  get selectedId => this._selectedId; ////Datum y luego valor
  set selectedId(valor) {
    this._selectedId = valor;
    this._isLoading = true;
    this.getEstacionesPorId(valor);
    notifyListeners();
  }

  get selectedIdPeticion => this._selectedIdPeticion; ////Datum y luego valor
  set selectedIdPeticion(valor) {
    this._selectedIdPeticion = valor;
    //  this._isLoading2 = true;
    this.getEstacionMedidas(valor);
    print('bandera');

    notifyListeners();
  }

/////////////////DATUM
  get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this._isLoading = true;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

/*  
  CREO QUE ESTA FUNCION SOBRA
  
  getTopHeadlines() async {
    ///DATUM
    final url = '$_URL_NEWS/api/estacion';
    final resp = await http.get(url);

    final newsResponse = estacionesFromJson(resp.body);
    this.headlines.addAll(newsResponse);
  } */

  List<Estaciones> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];

  /////////////////RespuestaEstacion
  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }
    final url = '$_URL_NEWS/api/$category';
    final resp = await http.get(url);
    final newsResponse = estacionesFromJson(resp.body);
    this.categoryArticles[category].addAll(newsResponse);
    this._isLoading = false;
    this.headlines.addAll(newsResponse);
    print('esta es la medida de la lista ${headlines.length}');
    print('******************************************************************');
    for (var i = 0; i < headlines.length; i++) {
      print(headlines[i].nombre);
    }
    print('******************************************************************');
    notifyListeners();
  }

  //////////////////////Respuesta

  getEstacionesPorId(int id) async {
    estacion = [];

    final url = '$_URL_NEWS/api/medidas?id=$id';

    final resp = await http.get(url);
    print('ya estra la peticion');

    final newsResponse = respuestaEstacionFromJson(resp.body);

    this._isLoading = false;
    this.estacion.add(newsResponse);
    this.estacion2.add(newsResponse);

    // print('datos en la estacion: ' + estacion.length.toString());
    // print('co: ' + estacion.last.iaqi.co.v.toString());
    // print('h: ' + estacion.last.iaqi.h.v.toString());
    // print('no2:  ' + estacion.last.iaqi.no2.v.toString());
    // print('o3: ' + estacion.last.iaqi.o3.v.toString());
    // print('p: ' + estacion.last.iaqi.p.v.toString());
    // print('pm10: ' + estacion.last.iaqi.pm10.v.toString());
    // print('pm25: ' + estacion.last.iaqi.pm25.v.toString());
    // print('so2: ' + estacion.last.iaqi.so2.v.toString());
    // print('t: ' + estacion.last.iaqi.t.v.toString());
    // print('wg: ' + estacion.last.iaqi.wg.v.toString());

    print('entro');
    // print('id presionado: ' + _selectedId.toString());
    // print('va en  : ' + estacion.length.toString());
    // print('estacion : ' + estacion.length.toString());
    notifyListeners();
  }

  getEstacionMedidas(int id) async {
    estacion = [];
    print("tomo muestra");
    final url = '$_URL_NEWS/api/medidas?id=$id';
    final resp = await http.get(url);
    final newsResponse = respuestaEstacionFromJson(resp.body);

    //this._isLoading = false;
    this.estacion.add(newsResponse);

    // print('va en  : ' + estacion.length.toString());
    // print('estacion : ' + estacion.length.toString());
    notifyListeners();
  }
}
