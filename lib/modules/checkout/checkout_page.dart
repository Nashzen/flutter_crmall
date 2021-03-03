import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/components/rounded_button.dart';
import 'package:teste_flutter_crmall/modules/checkout/widgets/comic_checkout_tile.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';

class CheckoutPage extends StatelessWidget {
  ComicsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your cart'),
          centerTitle: true,
        ),
        body: controller.comicsOnCartList.length <= 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset(
                    "assets/images/empty-cart.png",
                  ),
                ),
              )
            : Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    itemCount: controller.comicsOnCartList.length,
                    itemBuilder: (context, index) {
                      return ComicCheckoutTile(
                        price: controller.comicsOnCartList[index].price,
                        title: controller.comicsOnCartList[index].title,
                      );
                    }),
              ));
  }
}
