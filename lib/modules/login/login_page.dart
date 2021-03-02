import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bem-vindo'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  //NOTE logo
                  Container(
                    margin: EdgeInsets.only(
                      top: (48),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(labelText: 'Senha'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  TextButton(
                    // textColor: Colors.white,
                    // color: Colors.blue[300],
                    onPressed: () {
                      Get.off(() => MenuPage());
                    },
                    child: Text("Entrar"),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 30),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Esqueceu a senha?'),
                            content: Container(
                              height: 180,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Email'),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    decoration:
                                        InputDecoration(labelText: 'Senha'),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Trocar senha'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
