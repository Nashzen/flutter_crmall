import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:teste_flutter_crmall/app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:teste_flutter_crmall/models/new_models/new_comics_model.dart';

class ComicRepository {
  String baseUrl =
      '$BASE_URL/comics?ts=1&apikey=$API_KEY&hash=$HASH_CONVERTIDO';

  // final Dio dio;
  // ComicRepository({this.dio});

  // Future<NewComicsModel> getComics() async {
  //   try {
  //     Response response = await dio.get(baseUrl);
  //     return NewComicsModel.fromJson(response.data['data']);
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
  Future<NewComicsModel> getComics() async {
    // Future<List<Comics>> getComics() async {
    try {
      var response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return NewComicsModel.fromJson(data);
        // return List<Comics>.from(data['data'].map((x) => Comics.fromJson(x)));
      } else {
        return NewComicsModel();
        // return <Comics>[];
      }
    } catch (e) {
      print(e);
      return NewComicsModel();
      // return <Comics>[];
    }
  }
}
