import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as convert;

import 'package:flutter_read_json/interfaces/noticias.dart';

//public
//private     utilizamos el _
//protected

class _ProviderNoticias {
Future<List<Noticias>> cargarNoticias() async {
    List<Noticias> data=[];
    final _datosJson = await rootBundle.loadString('database/cardlist.json');
    List<dynamic> datosList = convert.jsonDecode(_datosJson);
    data = datosList.map((e) => Noticias.fromJson(e)).toList();
    return data;
  }
}

final listNoticias = _ProviderNoticias();
