import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/styles.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(text, style: k15Medium),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            color: kWhite.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
