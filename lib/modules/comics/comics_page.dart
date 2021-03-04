import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'package:teste_flutter_crmall/modules/comics/comic_detail_page.dart';
import 'package:teste_flutter_crmall/modules/comics/widgets/comic_tile.dart';

import 'comics_controller.dart';
import 'comics_controller.dart';

class ComicsPage extends StatelessWidget {
  final ComicsController controller = Get.find();
  ScrollController _scrollController = new ScrollController();

  var prices = [
    5.00,
    7.00,
    9.00,
    2.00,
    15.00,
  ]; // Array de precos aleatorios para os gibis

  @override
  Widget build(BuildContext context) {
    var countComics = controller.comicList
        .fold(0, (previousValue, e) => previousValue + e.data.results.length);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.getMoreComics();
      }
    });

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: marvelRed,
          ),
        );
      } else {
        return Scaffold(
          body: Column(
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
                          onSubmitted: (String text) {
                            controller.searchTextController.value.text = text;
                          },
                          controller: controller.searchTextController.value,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          controller.searchComics();
                        },
                      ),
                    ],
                  )),
              controller.comics.value.data.results.length > 0 ||
                      controller.comics.value.data.results.length != null
                  ? Expanded(
                      child: new GridView.builder(
                          padding: EdgeInsets.only(top: 5.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                          ),
                          controller: _scrollController,
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
                                  : controller.comics.value.data.results[index]
                                      .prices[0].price,
                              onTap: () {
                                Get.to(() => ComicDetailPage(
                                      description: controller.comics.value.data
                                          .results[index].description,
                                      imageUrl:
                                          '${controller.comics.value.data.results[index].thumbnail.path}.${controller.comics.value.data.results[index].thumbnail.extension}',
                                      title: controller.comics.value.data
                                          .results[index].title,
                                      price: prices[
                                          Random().nextInt(prices.length)],
                                    ));
                              },
                            );
                          }),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            Image.asset(
                              "assets/icons/thanos-real.png",
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Nothing here :(',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        );
      }
    });
  }
}
