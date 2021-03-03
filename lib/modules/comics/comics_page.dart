// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';
// import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
// import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
// import 'package:teste_flutter_crmall/modules/comics/widgets/comic_tile.dart';

// class ComicsPage extends StatelessWidget {
//   final ComicsController controller = Get.find();
//   final ScrollController scrollController = new ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(
//             backgroundColor: marvelRed,
//           ),
//         );
//       } else {
//         return StaggeredGridView.countBuilder(
//           crossAxisCount: 2,
//           itemCount: controller.comics.value.data.results.length,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           itemBuilder: (context, index) {
//             return ComicTile(
//               comicName: controller.comics.value.data.results[index].title,
//               imageUrl:
//                   '${controller.comics.value.data.results[index].thumbnail.path}.${controller.comics.value.data.results[index].thumbnail.extension}',
//               price: (controller.comics.value.data.results[index].prices ==
//                       null)
//                   ? '-'
//                   : controller.comics.value.data.results[index].prices[0].price,
//             );
//           },
//           staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//         );
//       }
//     });
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'package:teste_flutter_crmall/modules/comics/comic_detail_page.dart';
import 'package:teste_flutter_crmall/modules/comics/widgets/comic_tile.dart';

import 'comics_controller.dart';

class ComicsPage extends StatelessWidget {
  final ComicsController controller = Get.find();
  final ScrollController scrollController = new ScrollController();

  var prices = [
    5.00,
    7.00,
    9.00,
    2.00,
    15.00,
  ]; // Array de precos aleatorios para os gibis

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: marvelRed,
          ),
        );
      } else {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              heroTag: 'comicsbtn',
              onPressed: () {
                controller.getMoreComics();
              },
              tooltip: 'Refresh',
              child: Icon(Icons.refresh),
              elevation: 2.0,
            ),
            body: ModalProgressHUD(
              inAsyncCall: controller.isLoading.value = false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Search for a comic"),
                              onSubmitted: (text) {
                                // _prepareSearch();
                              },
                              // controller: _editTextController,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // _prepareSearch();
                            },
                          ),
                        ],
                      )),
                  Expanded(
                    child: NotificationListener(
                        onNotification: onNotification,
                        child: new GridView.builder(
                            padding: EdgeInsets.only(top: 5.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                            ),
                            controller: scrollController,
                            itemCount:
                                controller.comics.value.data.results.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              return ComicTile(
                                comicName: controller
                                    .comics.value.data.results[index].title,
                                imageUrl:
                                    '${controller.comics.value.data.results[index].thumbnail.path}.${controller.comics.value.data.results[index].thumbnail.extension}',
                                price: (controller.comics.value.data
                                            .results[index].prices ==
                                        null)
                                    ? '-'
                                    : controller.comics.value.data
                                        .results[index].prices[0].price,
                                onTap: () {
                                  Get.to(() => ComicDetailPage(
                                        description: controller.comics.value
                                            .data.results[index].description,
                                        imageUrl:
                                            '${controller.comics.value.data.results[index].thumbnail.path}.${controller.comics.value.data.results[index].thumbnail.extension}',
                                        title: controller.comics.value.data
                                            .results[index].title,
                                        price: prices[
                                            Random().nextInt(prices.length)],
                                      ));
                                },
                              );
                            })),
                  ),
                ],
              ),
            ));
      }
    });
  }

  bool onNotification(ScrollNotification notification) {
    print("Notification");

    if (notification is ScrollUpdateNotification) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (controller.isLoading.value == true) {
          controller.getComics();
        }
      }
    }

    return true;
  }
}
