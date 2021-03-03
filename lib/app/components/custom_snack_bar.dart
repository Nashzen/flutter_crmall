import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String text;
  CustomSnackBar({this.text});
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Colors.lightGreen[600],
      duration: Duration(seconds: 3),
      content: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
  }
}
