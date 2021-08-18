import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/models/clima_models.dart';
import 'package:flutter_proyecto_cicata/src/services/busqueda_services.dart';
import 'package:flutter_proyecto_cicata/src/widgets/date_ranger_picker_widget.dart';
import 'package:flutter_proyecto_cicata/src/widgets/filtrosInformacion_widget.dart';

/// This is the main application widget.
class BusquedaAvanzada extends StatefulWidget {
  const BusquedaAvanzada({Key key}) : super(key: key);

  static const String _title = 'Búsqueda Avanzada';

  @override
  _BusquedaAvanzadaState createState() => _BusquedaAvanzadaState();
}

class _BusquedaAvanzadaState extends State<BusquedaAvanzada> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BusquedaAvanzada._title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FiltrosWidget(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    @required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Estaciones',
    );
  });
}

/// This is the stateful widget that the main application instantiates.
class FiltrosWidget extends StatefulWidget {
  const FiltrosWidget({Key key}) : super(key: key);

  @override
  State<FiltrosWidget> createState() => _FiltrosWidgetState();
}

/// This is the private State class that goes with FiltrosWidget.
class _FiltrosWidgetState extends State<FiltrosWidget> {
  List<int> _listIdStations = [];
  List<int> _listIdStations2 = [];
  Future<List<RespuestaEstacion>> _listDataStations;

  @override
  void initState() {
    super.initState();
    _listIdStations = _listIds;
    _listIdStations2 = _listIds;
    //CUANDO CARGA LA APP INICIALIZA LA LISTA CON LOS DATOS DE LAS ESTACIONES USANDO LA LISTA DE ARRIBA PARA OBTENERLOS
    //_listDataStations = getStationsData(_listIdStations);
  }

  bool _todasValue = true,
      _cicataValue = false,
      _refugioValue = false,
      _utsjrValue = false,
      _sjrValue = false;

  //Variables con los id de las estaciones
  List<int> _listIds = [1, 2, 3, 4];
  int _cicataId = 1, _refugioId = 2, _utsjrId = 3, _sjrId = 4, _ban = 1;
  final List<Item> _data = generateItems(1);
  final List<Item> _data1 = generateItems(1);
  String _vista = 'Todas';
  final _listaPM25 = [
    'Todas',
    '0-50',
    '51-100',
    '101-150',
    '151-200',
    '201-250',
    '251-300',
    '300+'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Búsqueda avanzada'),
        ),
        body: Column(
          children: <Widget>[
            _buildPanelFiltros(),
            SizedBox(height: 40),
            _infoStations(),
          ],
        ));
  }

  Widget _infoStations() {
    _listDataStations = getStationsData(_listIdStations);
    return Expanded(
      child: Center(
        //SE CREA EL FUTURO PARA RECIBIR PROXIMAMENTE UNA LISTA DE WIDGETS
        child: FutureBuilder(
          future: _listDataStations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: tableData(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print('Este es el error: ');
              print(snapshot.error);
              return Text('Error al conectar con la API');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPanelFiltros() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data1[index].isExpanded = !isExpanded;
        });
      },
      elevation: 3,
      children: _data1.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.blue,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Center(
                child: Text(
                  'Filtros',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          body: Column(
            children: <Widget>[
              Card(
                elevation: 5.0,
                child: Column(
                  children: [
                    _buildPanelEstaciones(),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              //
              Card(
                elevation: 5.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Medida de AQI(Air Quality Index):',
                      style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    DropdownButton(
                      items: _listaPM25.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) => {
                        setState(() {
                          _vista = value;
                        })
                      },
                      hint: Text(
                        _vista,
                        style: TextStyle(color: Colors.black, fontSize: 17.0),
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(
                height: 15.0,
              ),
              Card(
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    DateRangePickerWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                child: const Text('Aplicar'),
                onPressed: () {
                  String fDesde, fHasta;

                  fDesde = getFrom();
                  fHasta = getUntil();

                  // print(fDesde);
                  // print(fHasta);

                  if (fDesde == 'Desde' && fHasta == 'Hasta') {
                    print('entre');
                  } else {
                    // fDesde = convertirFecha(fDesde);
                    // fHasta = convertirFecha(fHasta);
                    print(fDesde);
                    print(fHasta);
                    print(
                        '***********************************************************');

                    String data = calcularFechas(fDesde, fHasta);
                  }

                  // setState(() {
                  //   _listIdStations = _listIdStations2;
                  // });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade700,
                ),
              ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget _buildPanelEstaciones() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      elevation: 0,
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Center(
                child: Text(
                  item.headerValue,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          body: Column(
            children: <Widget>[
              Row(
                children: [
                  Column(
                    children: [
                      Checkbox(
                          value: _todasValue,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              _todasValue = value;
                              if (value) {
                                _ban = 1;
                                _listIdStations2 = [];
                                _listIdStations2 = _listIds;
                                _cicataValue = false;
                                _refugioValue = false;
                                _utsjrValue = false;
                                _sjrValue = false;
                              } else {
                                _ban = 0;
                                _listIdStations2 = [];
                              }
                            });
                          }),
                    ],
                  ),
                  Text('Todas'),
                  SizedBox(
                    width: 50.0,
                  ),
                  Column(
                    children: [
                      Checkbox(
                          value: _cicataValue,
                          onChanged: (bool value) {
                            _validarLista();
                            print(value);
                            getIdStations(_cicataId, value);
                            setState(() {
                              _cicataValue = value;
                              _todasValue = false;
                              _condicionTodas();
                            });
                          })
                    ],
                  ),
                  Text('CICATA')
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Checkbox(
                          value: _refugioValue,
                          onChanged: (bool value) {
                            _validarLista();
                            print(value);
                            getIdStations(_refugioId, value);
                            setState(() {
                              _refugioValue = value;
                              _todasValue = false;
                              _condicionTodas();
                            });
                          }),
                    ],
                  ),
                  Text('El Refigio'),
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      Checkbox(
                          value: _utsjrValue,
                          onChanged: (bool value) {
                            _validarLista();
                            print(value);
                            getIdStations(_utsjrId, value);
                            setState(() {
                              _utsjrValue = value;
                              _todasValue = false;
                              _condicionTodas();
                            });
                          }),
                    ],
                  ),
                  Text('UTSJR'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: _sjrValue,
                      onChanged: (bool value) {
                        _validarLista();
                        print(value);
                        getIdStations(_sjrId, value);
                        setState(() {
                          _sjrValue = value;
                          _todasValue = false;
                          _condicionTodas();
                        });
                      }),
                  Text('Centro SJR'),
                ],
              ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void getIdStations(int id, bool check) {
    if (_listIdStations2.contains(id) && !check) {
      print('borre');
      _listIdStations2.remove(id);
      for (var item in _listIdStations2) {
        print(item);
      }
    } else {
      _listIdStations2.add(id);
      print('agregue');
      for (var item in _listIdStations2) {
        print(item);
      }
    }
  }

  void _condicionTodas() {
    if (_cicataValue == true &&
        _refugioValue == true &&
        _utsjrValue == true &&
        _sjrValue == true) {
      _ban = 1;
      _listIdStations2 = [];

      _todasValue = true;
      _cicataValue = false;
      _refugioValue = false;
      _utsjrValue = false;
      _sjrValue = false;

      _listIdStations2 = _listIds;
    }
  }

  void _validarLista() {
    if (_ban == 1) {
      _ban = 0;
      _listIdStations2 = [];
    }
  }
}
