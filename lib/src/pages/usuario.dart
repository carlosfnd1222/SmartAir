import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/bloc/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_proyecto_cicata/src/models/producto_model.dart';
import 'package:flutter_proyecto_cicata/src/utils/utils.dart' as utils;

class UsuarioPage extends StatefulWidget {
  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  ProductosBloc productosBloc;
  ProductoModel producto = new ProductoModel();

  File foto;

  @override
  Widget build(BuildContext context) {
    productosBloc = Provider.productosBloc(context);

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Mi cuenta'),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.photo_size_select_actual),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                //  _mostrarFoto(),
                _crearTitulo(),
                // _crearAcciones(),
                // _crearTexto(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    final bloc = Provider.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Correo: ' + bloc.email, style: estiloTitulo),
                  SizedBox(height: 7.0),
                  Text('', style: estiloSubTitulo),
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
          ],
        ),
      ),
    );
  }
}
