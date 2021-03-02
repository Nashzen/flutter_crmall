import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/models/new_models/new_comics_model.dart';
import 'package:teste_flutter_crmall/repositories/comic_repository.dart';

class ComicsController extends GetxController {
  final ComicRepository repository;
  ComicsController({@required this.repository}) : assert(repository != null);

  final comics = NewComicsModel().obs;
  // final comicResponse = Data().obs;

  @override
  void onInit() {
    super.onInit();
    getComics();
  }

  Future getComics() async {
    comics.value = await repository.getComics();
    return comics;
  }

  newOffsetNumber() async {
    var previousOffset = comics.value.data.offset;
    comics.value.data.offset = previousOffset + 20;
    getComics();
  }
}
