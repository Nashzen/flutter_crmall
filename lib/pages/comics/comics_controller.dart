import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/models/comic_list_model.dart';
import 'package:teste_flutter_crmall/pages/comics/comic_repository.dart';

class ComicsController extends GetxController {
  final ComicRepository repository;
  ComicsController({@required this.repository}) : assert(repository != null);

  // final _comics = ComicListModel().obs;
  // set comics(value) => this._comics.value = value;
  // get comics => this._comics.value;

  // Future getComics() async {
  //   await repository.getComics().then((data) {
  //     comics = data;
  //   });
  // }

  var comics = <Data>[].obs;

  Future<List<Data>> getComics() async {
    comics.value = await repository.getComics();
    return comics;
  }
}
