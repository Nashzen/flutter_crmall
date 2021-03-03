import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/login/login_page.dart';
import 'package:teste_flutter_crmall/modules/profile/widgets/list_tile_options.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // ListTileOption(
                //   icon: Icons.person,
                //   text: 'Profile',
                //   onTap: () {
                //     // Get.to(page);
                //   },
                // ),
                ListTileOption(
                  icon: CupertinoIcons.shopping_cart,
                  text: 'Purchases historic',
                  onTap: () {
                    // Get.to(page);
                  },
                ),
                ListTileOption(
                  icon: Icons.exit_to_app_rounded,
                  text: 'Exit app',
                  onTap: () {
                    Get.offAll(() => LoginPage());
                  },
                ),
              ],
            );
          }),
    );
  }
}
