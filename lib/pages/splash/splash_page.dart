import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/pages/menu/menu_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    startTimeout();
  }

  startTimeout() async {
    return Timer(Duration(seconds: 4), changeScreen);
  }

  changeScreen() async {
    Get.off(MenuPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            "assets/images/marvel-logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
