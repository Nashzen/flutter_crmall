import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teste_flutter_crmall/pages/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/pages/comics/comic_provider.dart';
import 'package:teste_flutter_crmall/pages/comics/comic_repository.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComicsController>(
      () => ComicsController(
        repository: ComicRepository(
          provider: ComicProvider(
            httpClient: http.Client(),
          ),
        ),
      ),
    );

    Get.lazyPut<ComicsController>(
      () => ComicsController(
        repository: ComicRepository(
          provider: ComicProvider(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
  }
}
