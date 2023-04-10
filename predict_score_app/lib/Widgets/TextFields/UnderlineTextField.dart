import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/styles.dart';

class UnderlineTextField extends StatelessWidget {
  const UnderlineTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: k13Medium,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: k13Medium.copyWith(color: kWhite.withOpacity(0.3)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: kDarkBlue,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: kWhite.withOpacity(0.3),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: kRed),
        ),
        errorStyle: k0,
      ),
      cursorColor: kDarkBlue,
    );
  }
}
