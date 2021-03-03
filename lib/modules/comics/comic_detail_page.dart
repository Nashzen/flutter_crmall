import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/components/rounded_button.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'package:teste_flutter_crmall/models/cart_comic_model.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';

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
      backgroundColor: colorBackground,
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: lightInput,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: lightInput),
              ),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: lightInput,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            imageUrl,
                            width: 200,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Center(
                                  child: Text(
                                    '$title',
                                    overflow: TextOverflow.clip,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Price: \$${price}0',
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.w700),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      description != null
                          ? description
                          : 'No description provided',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Add to cart",
                    press: () {
                      CartComicModel cartComicModel = CartComicModel();
                      cartComicModel.price = price;
                      cartComicModel.title = title;
                      controller.comicsOnCartList.obs.value.add(cartComicModel);
                      print(controller.comicsOnCartList.obs.value);
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
