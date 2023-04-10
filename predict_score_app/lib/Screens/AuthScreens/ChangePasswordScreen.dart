import 'package:flutter/material.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';
import 'package:predict_score_app/Widgets/BlueButton.dart';

import '../../Constants/styles.dart';
import '../../Widgets/TextFields/TextFieldWidget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static const id = "change_password";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        children: [
          ///Change Password
          Text("Change Password", style: k21Bold),
          const SizedBox(height: 48),

          ///Current Password
          TextFieldWidget(hintText: "Current Password"),
          const SizedBox(height: 24),

          ///New Password
          TextFieldWidget(hintText: "New Password"),
          const SizedBox(height: 24),

          ///Confirm Password
          TextFieldWidget(hintText: "Confirm Password"),
          const SizedBox(height: 24),

          ///Change Password Button
          BlueButton(text: "Change Password", function: () {}),
        ],
      ),
    );
  }
}
