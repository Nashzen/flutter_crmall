import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste_flutter_crmall/app/components/rounded_button.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'package:teste_flutter_crmall/modules/checkout/widgets/comic_checkout_tile.dart';
import 'package:teste_flutter_crmall/modules/checkout/widgets/custom_dialogs.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';

class CheckoutPage extends StatelessWidget {
  ComicsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.lightGreen[600],
      duration: Duration(seconds: 3),
      content: Text(
        'Payment made successfully!',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
              'Your cart - TOTAL: \$${controller.comicsOnCartList.fold(0, (previousValue, e) => previousValue + e.price)}0'),
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
            : Obx(
                () => Stack(
                  children: [
                    ListView.builder(
                      itemCount: controller.comicsOnCartList.length,
                      itemBuilder: (context, i) {
                        return ComicCheckoutTile(
                          price: controller.comicsOnCartList[i].price,
                          title: controller.comicsOnCartList[i].title,
                          onTap: () {
                            controller.comicsOnCartList
                                .remove(controller.comicsOnCartList[i]);
                          },
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        width: 300,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Go to checkout',
                              style: TextStyle(fontSize: 18)),
                          onPressed: () => {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogs(
                                  price:
                                      '${controller.comicsOnCartList.fold(0, (previousValue, e) => previousValue + e.price)}',
                                  onTap: () {
                                    controller.comicsOnCartList.obs.value
                                        .forEach((e) {
                                      controller.buyComics(e);
                                    });
                                    // controller.buyComics(
                                    //     controller.comicsOnCartList.obs.value.forEach((e) {e.}));
                                    controller.comicsOnCartList.obs.value
                                        .clear();
                                    print(controller.myPurchases.obs.value);
                                    Get.back();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                );
                              },
                            )
                          },
                          color: marvelRed,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
