import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/bloc/provider.dart' as provider;
import 'package:flutter_proyecto_cicata/src/pages/busquedaAvanzada.dart';
import 'package:flutter_proyecto_cicata/src/pages/carrito_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/login_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/navegacion_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/producto_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/recomendaciones_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/registro_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/tabs_page.dart';
import 'package:flutter_proyecto_cicata/src/pages/usuario.dart';
import 'package:flutter_proyecto_cicata/src/pages/visualizar_page.dart';
import 'package:flutter_proyecto_cicata/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter_proyecto_cicata/src/services/service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //CODIGO PRUEBAS
    //FIN CODIGO PRUEBAS

    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new NewsService()),
        ],
        child: provider.Provider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Clima',
            initialRoute:
                'filtrosAvanzada', //cambiar a login para entrar a la aplicacion general o a filtrosAvanzada para visualizar la parte de buscar información por filtros
            routes: {
              'login': (BuildContext context) => LoginPage(),
              'registro': (BuildContext context) => RegistroPage(),
              'producto': (BuildContext context) => ProductoPage(),
              'visualizar': (BuildContext context) => VisualizarPage(),
              'navegacion': (BuildContext context) => BotonesPage(),
              'carrito': (BuildContext context) => CarritoPage(),
              'menu': (BuildContext context) => TabsPage(),
              'recomendaciones': (BuildContext context) =>
                  RecomendacionesPage(),
              'usuario': (BuildContext context) => UsuarioPage(),
              'filtrosAvanzada': (BuildContext context) =>
                  BusquedaAvanzada(), // esta ruta sirve para acceder a la parte nueva para aplicar filtros
            },
          ),
        ));
  }
}
