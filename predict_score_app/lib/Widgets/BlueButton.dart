import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: kDarkBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(text, style: k17Bold),
        ),
      ),
    );
  }
}
