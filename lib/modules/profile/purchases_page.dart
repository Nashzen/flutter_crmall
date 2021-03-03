import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/modules/profile/widgets/bought_comic_tile.dart';

class PurchasesPage extends StatelessWidget {
  final ComicsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Your purchases'),
          centerTitle: true,
        ),
        body: controller.myPurchases.length <= 0
            ? Center(
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
                        'You have not bought anything yet :(',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            : Obx(
                () => Stack(
                  children: [
                    ListView.builder(
                      itemCount: controller.myPurchases.length,
                      itemBuilder: (context, i) {
                        return BoughtComicTile(
                          title: controller.myPurchases[i].title,
                          price: controller.myPurchases[i].price,
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
