import 'package:get/get.dart';
import '../../repositories/comic_repository.dart';
import 'comics_controller.dart';

class ComicsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComicsController>(() {
      final ComicRepository repository = ComicRepository();
      return ComicsController(repository: repository);
    });
  }
}
