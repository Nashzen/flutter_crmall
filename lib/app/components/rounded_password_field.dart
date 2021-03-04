import 'package:flutter/material.dart';
import 'package:teste_flutter_crmall/app/components/text_field_container.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  bool visiblePassword = false;
  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.visiblePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: marvelRed,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: marvelRed,
            onPressed: () {
              visiblePassword = !visiblePassword;
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
