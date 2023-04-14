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
          TextFieldWidget(labelText: "Current Password",hintText: "******",),
          const SizedBox(height: 24),

          ///New Password
          TextFieldWidget(labelText: "New Password",hintText: "******",),
          const SizedBox(height: 24),

          ///Confirm Password
          TextFieldWidget(labelText: "Confirm Password",hintText: "******",),
          const SizedBox(height: 24),

          ///Change Password Button
          BlueButton(text: "Change Password", function: () {}),
        ],
      ),
    );
  }
}
