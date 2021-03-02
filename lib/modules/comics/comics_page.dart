import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/modules/comics/widgets/comic_card_widget.dart';

class ComicsPage extends StatelessWidget {
  final ComicsController controller = Get.find();
  final ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.comics.value.data.results == null ||
              controller.comics.value.data.results.length < 1
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  controller.comics.value.data.results.length, (index) {
                return ComicCardWidget(
                  comicName: controller.comics.value.data.results[index].title,
                  imageUrl:
                      '${controller.comics.value.data.results[index].thumbnail.path}.${controller.comics.value.data.results[index].thumbnail.extension}',
                );
              }),
            );
      // ListView.builder(
      //     itemCount: controller.comics.value.data.results.length,
      //     itemBuilder: (context, i) {
      //       return ListTile(
      //         title:
      //             Text('${controller.comics.value.data.results[i].title}'),
      //       );
      //     },
      //   );
    });
  }
}
