import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/models/cart_comic_model.dart';
import 'package:teste_flutter_crmall/models/comics_model.dart';
import 'package:teste_flutter_crmall/repositories/comic_repository.dart';

class ComicsController extends GetxController {
  final ComicRepository repository;
  ComicsController({@required this.repository}) : assert(repository != null);

  final comics = ComicsModel().obs;
  final isLoading = true.obs; //para demonstrar o carregamento da requisicao
  final newOffset = 20.obs;
  final comicsOnCartList = <CartComicModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getComics();
  }

  //Requisicao inicial para obter as HQs
  Future getComics() async {
    try {
      isLoading(true);
      var comicResponse = await repository.getComics();
      if (comicResponse != null) {
        comics.value = comicResponse;
      }
    } finally {
      isLoading(false);
    }
  }

  //Carregar mais HQs
  Future getMoreComics() async {
    comics.value.data.offset += 20;
    await getComics();
  }

  //Adicionar uma HQ ao carrinho de compras
  Future addComicToCart() async {
    print(comicsOnCartList.obs.value);
  }
}
