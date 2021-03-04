import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:teste_flutter_crmall/models/comics_model.dart';

class ComicRepository {
  String baseUrlDio = 'https://gateway.marvel.com:443/v1/public/comics';
  var dio = Dio();
  Future<ComicsModel> getComics({String offset}) async {
    Map<String, String> parameters = {
      "apikey": '8575ace7dd18d1d498d750bf6cf53568',
      "ts": '1',
      "hash": 'bdafbd7229a450547a2843584ab0ebb6',
      "offset": offset,
    };
    try {
      var response = await dio.get(baseUrlDio, queryParameters: parameters);
      if (response.statusCode == 200) {
        var data = json.decode(response.toString());
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
