// import 'package:flutter/material.dart';
// import 'package:formvalidation/src/services/service.dart';
// import 'package:formvalidation/src/widgets/estacion.dart';
// import 'package:formvalidation/src/widgets/estacionPeticion.dart';
// import 'package:provider/provider.dart';

// class Tab1PageEstacionPeticion extends StatefulWidget {
//   @override
//   _Tab1PageEstacionPeticionState createState() =>
//       _Tab1PageEstacionPeticionState();
// }

// class _Tab1PageEstacionPeticionState extends State<Tab1PageEstacionPeticion>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     final estacion = Provider.of<NewsService>(context).estacion;
//     final estacion2 = Provider.of<NewsService>(context).estacion2;
//     final newsService = Provider.of<NewsService>(context);

//     return Scaffold(
//         body: Column(
//       children: <Widget>[
//         if (newsService.estacion.length > 0)
//           Expanded(child: Estacion(newsService.estacion))
//         else if (!newsService.isLoading)
//           Expanded(child: EstacionPeticion(newsService.estacion)),
//         if (newsService.isLoading)
//           Expanded(
//               child: Center(
//             child: CircularProgressIndicator(),
//           ))
//       ],
//     ));
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
