import 'package:flutter/material.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';
import 'package:predict_score_app/Widgets/BlueButton.dart';
import 'package:predict_score_app/Widgets/TextFields/TextFieldWidget.dart';

import '../../Scaffolds/TabsScaffold.dart';
import 'ForgotPasswordScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static const id = "sign_in_screen";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        children: [
          ///Sign In
          Text("Sign In", style: k21Bold),
          const SizedBox(height: 48),

          ///Email
          TextFieldWidget(
            labelText: "Email",
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),

          ///Password
          TextFieldWidget(
            labelText: "Password",
            hintText: "Enter your password",
            isPassword: true,
          ),

          const SizedBox(height: 12),

          ///Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                Navigator.pushNamed(context, ForgotPassword.id);
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("Forgot Password ?", style: k16SemiBold)),
            ),
          ),

          const SizedBox(height: 18),

          ///Sign In Button
          BlueButton(
              text: "Sign In",
              function: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TabsScaffold.id, (Route<dynamic> route) => false);
              }),
        ],
      ),
    );
  }
}
