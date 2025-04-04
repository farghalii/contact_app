import 'package:contact_app/core/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  String hint;
  bool? border = true;
  UserInfo({required this.hint,  this.border});
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
