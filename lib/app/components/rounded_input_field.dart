import 'package:flutter/material.dart';
import 'package:teste_flutter_crmall/app/components/text_field_container.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: marvelRed,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: marvelRed,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
