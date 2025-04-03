import 'package:contact_app/core/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  String hint;
  UserInfo({required this.hint});
  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Appcolors.gold),
          hintText: hint,
        ));
  }
}
