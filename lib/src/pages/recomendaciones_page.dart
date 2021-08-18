import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/pages/recomendaciones_page.dart';
import 'dart:math';
import 'dart:ui';

class RecomendacionesPage extends StatefulWidget {
  @override
  _IAlertDialogState createState() => _IAlertDialogState();
}

class _IAlertDialogState extends State<RecomendacionesPage> {
  final estiloTitulo = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 20.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recomendaciones"),
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _crearImagen(context),
              _crearTitulo(),
              Divider(),
              _implicacionesSalud(),
              _crearAcciones1(),
              Divider(),
              _crearAcciones2(),
              Divider(),
              _crearAcciones3(),
              Divider(),
              _crearAcciones4(),
              Divider(),
              _crearAcciones5(),
              Divider(),
            ],
          ),
        ));
  }

  ///
  ///

  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'scroll'),
        child: Image(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2019/08/30/21/16/lake-4442337_960_720.jpg'),
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Aviso de salud',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 34,
                      color: Colors.purple[900],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 7.0),
                  Text(
                      'Sabrias que precauciones tomar si aumenta el nivel de neblina? ',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.purple[800],
                      ),
                      textAlign: TextAlign.start),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _implicacionesSalud() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(' Prevencion PSI de 24',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 24,
                        color: Colors.purple[900],
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.cloud_done, 'Bueno'),
        _accion0(Icons.cloud_done, 'Bueno'),
        _accion00(Icons.cloud_done, 'Bueno'),
      ],
    );
  }

  Widget _crearAcciones2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion2(Icons.group_work_rounded, 'Moderado'),
        _accion22(Icons.group_work_rounded, 'Moderado'),
        _accion222(Icons.group_work_rounded, 'Moderado'),
      ],
    );
  }

  Widget _crearAcciones3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion3(Icons.cloud_off, 'Nocivo'),
        _accion33(Icons.cloud_off, 'Nocivo'),
        _accion333(Icons.cloud_off, 'Nocivo'),
      ],
    );
  }

  Widget _crearAcciones4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion4(Icons.cloud_off, 'Muy nocivo'),
        _accion44(Icons.cloud_off, 'Muy nocivo'),
        _accion44(Icons.cloud_off, 'Muy nocivo'),
      ],
    );
  }

  Widget _crearAcciones5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion6(Icons.cloud_off, 'Peligroso'),
        _accion66(Icons.cloud_off, 'Peligroso'),
        _accion666(Icons.cloud_off, 'Peligroso'),
      ],
    );
  }

  ///tabla de los colores accion 1
  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/mujer.PNG'),
                width: 100.00,
                height: 100.00,
              ),
            ],
          ),
        ),
        Text('AQI'),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.green),
        ),
        Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green,
                  title: Text("Personas saludables",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("0 - 50",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion0(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/ninos.png'),
                width: 100.00,
                height: 100.00,
              ),
            ],
          ),
        ),
        Text('AQI'),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.green),
        ),
        Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green,
                  title: Text("Mujeres embarazadas, personas mayores y niños",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("0 - 50",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion00(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/cardiacos.png'),
                width: 100.00,
                height: 100.00,
              ),
            ],
          ),
        ),
        Text('AQI'),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.green),
        ),
        Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green,
                  title: Text(
                      "Personas con enfermedad pulmonar crónica o enfermedad cardíaca",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("0 - 50",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 2
  Widget _accion2(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.blue[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.blue[700],
                  title: Text("Personas saludables",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("51 - 100",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion22(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.blue[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.blue[700],
                  title: Text("Enbarazadas, personas mayores, niños",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("51 - 100",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion222(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.blue[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.blue[700],
                  title: Text(
                      "personas con enfermedad pulmonar crónica o enfermedad cardíaca.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                  content: Text("Continuar con actividades normales",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("51 - 100",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 3
  Widget _accion3(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.yellowAccent[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.yellowAccent[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.yellowAccent[700],
                  title: Text("Personas saludables",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Reducir el exterior físico prolongado o extenuante al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("101 - 150",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion33(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.yellowAccent[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.yellowAccent[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.yellowAccent[700],
                  title: Text("Embarazadas, personas mayores, niños",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Minimizar el esfuerzo físico prolongado o agotador al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("101 - 150",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion333(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.yellowAccent[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.yellowAccent[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.yellowAccent[700],
                  title: Text(
                      "Personas con enfermedad pulmonar crónica o enfermedad cardíaca",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Evite el exterior físico prolongado o severo al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("101 - 150",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion4(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.orange[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.orange[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.orange[700],
                  title: Text("Personas saludables",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                  content: Text(
                      "Evite el esfuerzo físico peligroso o agotador al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("201 - 300",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion44(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.orange[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.orange[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.orange[700],
                  title: Text("Embarazadas, personas mayores, niños",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                  content: Text("Minimiza la actividad al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("201 - 300",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 4

  Widget _accion444(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.orange[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.orange[700],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.orange[700],
                  title: Text(
                      "Personas con enfermedad pulmonar crónica o enfermedad cardíaca",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                  content: Text("Evite la actividad al aire libre,",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("201 - 300",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion54(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[800]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[600],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[600],
                  title: Text("Nocivo",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Todos pueden comenzar a experimentar efectos sobre la salud; los miembros de grupos sensibles pueden experimentar efectos de salud más graves",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI) 151 - 200",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 5

  ///tabla de los colores accion 4
  Widget _accion6(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[900]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[900],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[900],
                  title: Text("Personas saludables",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Minimiza la actividad al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text(">   300 ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion66(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[900]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[900],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[900],
                  title: Text("Embarazadas, personas mayores, niños",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Minimiza la actividad al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text(">   300 ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _accion666(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[900]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[900],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[900],
                  title: Text(
                      "Personas con enfermedad pulmonar crónica o enfermedad cardíaca",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text("Minimiza la actividad al aire libre.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text(">   300 ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
