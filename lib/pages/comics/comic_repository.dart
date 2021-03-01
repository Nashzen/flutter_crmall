import 'package:meta/meta.dart';
import 'package:teste_flutter_crmall/pages/comics/comic_provider.dart';

class ComicRepository {
  final ComicProvider provider;

  ComicRepository({@required this.provider}) : assert(provider != null);

  getComics() {
    return provider.getComics();
  }
}
