import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/models/cart_comic_model.dart';
import 'package:teste_flutter_crmall/models/comics_model.dart';
import 'package:teste_flutter_crmall/repositories/comic_repository.dart';

class ComicsController extends GetxController {
  final ComicRepository repository;
  ComicsController({@required this.repository}) : assert(repository != null);

  final comics = ComicsModel().obs;
  final comicList = <ComicsModel>[].obs;
  final isLoading = true.obs; //para demonstrar o carregamento da requisicao
  final pageOffset = 600.obs;
  final comicsOnCartList =
      <CartComicModel>[].obs; // Lista de quadrinhos no carrinho
  final myPurchases = <CartComicModel>[]
      .obs; // lista para adicionar as compras para listar depois

  @override
  void onInit() {
    super.onInit();
    getComics(pageOffset.value.toString());
  }

  //Requisicao inicial para obter as HQs
  Future getComics(String offset) async {
    try {
      isLoading(true);
      var comicResponse = await repository.getComics(offset: offset);
      if (comicResponse != null) {
        comics.value = comicResponse;
        comicList.add(comicResponse);
      }
    } finally {
      isLoading(false);
    }
  }

  Future getMoreComics() async {
    try {
      isLoading(true);
      var comicResponse =
          await repository.getComics(offset: '${pageOffset.value + 20}');
      if (comicResponse != null) {
        pageOffset.value += 20;
        comics.value = comicResponse;
        comicList.add(comicResponse);
      }
    } finally {
      isLoading(false);
    }
  }

  //Adicionar uma HQ ao carrinho de compras
  Future buyComics(CartComicModel comics) async {
    myPurchases.obs.value.add(comics);
    return myPurchases.obs.value;
  }
}
