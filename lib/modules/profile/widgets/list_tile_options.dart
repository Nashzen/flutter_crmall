import 'package:flutter/material.dart';

class ListTileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  ListTileOption({this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(
              icon,
              color: Colors.black,
            ),
            title: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onTap: onTap),
        Divider(
          color: Colors.grey[350],
          endIndent: 16,
          indent: 16,
        ),
      ],
    );
  }
}
