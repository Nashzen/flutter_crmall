import 'dart:convert';
import 'package:teste_flutter_crmall/app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:teste_flutter_crmall/models/comics_model.dart';

class ComicRepository {
  String baseUrl =
      '$BASE_URL/comics?ts=1&apikey=$API_KEY&hash=$HASH_CONVERTIDO';

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
