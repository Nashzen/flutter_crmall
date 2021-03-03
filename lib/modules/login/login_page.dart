import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/components/rounded_button.dart';
import 'package:teste_flutter_crmall/app/components/rounded_input_field.dart';
import 'package:teste_flutter_crmall/app/components/rounded_password_field.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Marvel App'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  //NOTE logo
                  Container(child: Image.asset('assets/images/logo-login.png')),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
                    child: Form(
                      child: Column(
                        children: [
                          RoundedInputField(
                            hintText: "Your Email",
                            onChanged: (value) {},
                          ),
                          RoundedPasswordField(
                            onChanged: (value) {},
                          ),
                          RoundedButton(
                            text: "LOGIN",
                            press: () {
                              Get.off(() => MenuPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
