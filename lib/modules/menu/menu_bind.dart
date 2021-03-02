import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/repositories/comic_repository.dart';

import 'menu_controller.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComicsController>(() {
      final ComicRepository repository = ComicRepository();
      return ComicsController(repository: repository);
    });

    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
  }
}
