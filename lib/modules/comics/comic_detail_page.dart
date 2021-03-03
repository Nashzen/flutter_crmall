import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/components/rounded_button.dart';
import 'package:teste_flutter_crmall/models/cart_comic_model.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_page.dart';

class ComicDetailPage extends StatelessWidget {
  final String imageUrl;
  final String description;
  final double price;
  final String title;

  ComicDetailPage({
    this.imageUrl,
    this.description,
    this.price,
    this.title,
  });

  final ComicsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        imageUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            '$title --- $price',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(fontSize: 18),
                            maxLines: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 8, 0.0, 0.0),
                    child: Center(
                      child: Text(
                        "Description:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: Center(
                child: Text(
                  description != null ? description : 'No description provided',
                  style: TextStyle(fontSize: 24),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            RoundedButton(
              text: "Add to cart",
              press: () {
                CartComicModel cartComicModel = CartComicModel();
                cartComicModel.price = price;
                cartComicModel.title = title;
                controller.comicsOnCartList.obs.value.add(cartComicModel);
                print(controller.comicsOnCartList.obs.value);
                Get.off(() => MenuPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
