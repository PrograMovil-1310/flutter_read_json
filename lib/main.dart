import 'package:flutter/material.dart';
import 'package:flutter_read_json/interfaces/noticias.dart';
import 'package:flutter_read_json/provider/provider_noticias.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showList(),
        ),
      ),
    );
  }

  Widget showList() {
    //   List<Noticias> listNoticias = listNoticias.cargarNoticias();
    return FutureBuilder(
        future: listNoticias.cargarNoticias(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: listWidgetNoticias(snapshot.data, context),
          );
        });
  }

  List<Widget> listWidgetNoticias(List<dynamic>? data, BuildContext context) {
    final List<Widget> listWidget = [];

    data?.forEach((element) {
      final card = Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(element.titulo)),
        ),
      );

      listWidget.add(card);
    });
    return listWidget;
  }
}
