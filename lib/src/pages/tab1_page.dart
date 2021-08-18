import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/services/service.dart';
import 'package:flutter_proyecto_cicata/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
