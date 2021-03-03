import 'package:flutter/material.dart';
import 'package:teste_flutter_crmall/app/components/text_field_container.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
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
          suffixIcon: Icon(
            Icons.visibility,
            color: marvelRed,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
