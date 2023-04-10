import 'package:flutter/material.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';

import '../../Constants/styles.dart';
import '../../Scaffolds/TabsScaffold.dart';
import '../../Widgets/BlueButton.dart';
import '../../Widgets/TextFields/TextFieldWidget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const id = "sign_up_screen";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        children: [
          Text("Sign Up", style: k21Bold),
          const SizedBox(height: 48),

          ///Name
          TextFieldWidget(
            hintText: "Name",
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 24),

          ///Email
          TextFieldWidget(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 24),

          ///Password
          TextFieldWidget(hintText: "Password", isPassword: true),
          SizedBox(height: 24),

          ///Sign In Button
          BlueButton(
              text: "Sign Up",
              function: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TabsScaffold.id, (Route<dynamic> route) => false);
              }),
        ],
      ),
    );
  }
}
