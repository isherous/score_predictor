import 'package:flutter/material.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';
import 'package:predict_score_app/Screens/AuthScreens/OTPScreen.dart';

import '../../Constants/styles.dart';
import '../../Widgets/BlueButton.dart';
import '../../Widgets/TextFields/TextFieldWidget.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  static const id = "phone_auth";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        children: [
          ///Sign In with Phone
          Text("Sign In with Phone", style: k21Bold),
          const SizedBox(height: 48),

          ///Phone
          TextFieldWidget(
            labelText: "Phone",
            hintText: "Enter your phone number",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 24),

          ///Name
          TextFieldWidget(
            labelText: "Name",
            hintText: "Enter your name",
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: 24),

          ///Send OTP
          BlueButton(
              text: "Send OTP",
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OTPScreen()));
              }),
        ],
      ),
    );
  }
}
