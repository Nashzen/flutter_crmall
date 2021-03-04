import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste_flutter_crmall/models/comics_model.dart';

class ComicRepository {
  String baseUrl =
      'https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=8575ace7dd18d1d498d750bf6cf53568&hash=bdafbd7229a450547a2843584ab0ebb6';

  Future<ComicsModel> getComics() async {
    try {
      var response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return ComicsModel.fromJson(data);
      } else {
        return ComicsModel();
      }
    } catch (e) {
      print(e);
      return ComicsModel();
    }
  }
}
