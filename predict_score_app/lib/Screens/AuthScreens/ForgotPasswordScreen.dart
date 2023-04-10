import 'package:flutter/material.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';

import '../../Constants/styles.dart';
import '../../Widgets/BlueButton.dart';
import '../../Widgets/TextFields/TextFieldWidget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const id = "forgot_password";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        children: [
          ///Forgot Password
          Text("Forgot Password", style: k21Bold),
          const SizedBox(height: 48),

          ///Email
          TextFieldWidget(hintText: "Email"),
          const SizedBox(height: 24),

          ///Reset Password Button
          BlueButton(text: "Reset Password", function: () {}),
        ],
      ),
    );
  }
}
