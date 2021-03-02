import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = 'e880145202debac7b4c09d03813ebb16';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '/3/movie/now_playing',
        {'api_key': _apiKey, 'languaje': _languaje});

    final respuesta = await http.get(url);

    final decodedData = json.decode(respuesta.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    
    return peliculas.items;
    
  }
}
