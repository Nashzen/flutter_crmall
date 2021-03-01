import 'package:get/get.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:teste_flutter_crmall/models/comic_list_model.dart';

const baseUrl = '$BASE_URL/comics?ts=1&apikey=$API_KEY&hash=$HASH_CONVERTIDO';

class ComicProvider {
  final http.Client httpClient;
  ComicProvider({@required this.httpClient});

  Future<List<Data>> getComics() async {
    try {
      var response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // print(data);
        return List<Data>.from(data["data"].map((x) => Data.fromJson(x)));
      } else {
        return <Data>[];
      }
    } catch (e) {
      print(e);
      return <Data>[];
    }
  }
}
