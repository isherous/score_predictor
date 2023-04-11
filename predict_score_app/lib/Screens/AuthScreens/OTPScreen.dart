import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Scaffolds/AuthScaffold.dart';
import 'package:predict_score_app/Scaffolds/TabsScaffold.dart';
import 'package:predict_score_app/Widgets/BlueButton.dart';

import '../../Constants/styles.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AuthScaffold(
      child: ListView(
        children: [
          ///Enter OTP
          Text("Please enter the OTP", style: k21Bold),
          const SizedBox(height: 48),

          ///Verification Code
          Text(
            "Verification Code",
            style: k13Medium.copyWith(
              color: kWhite.withOpacity(0.5),
            ),
          ),

          const SizedBox(height: 12),

          ///OTP TextField
          PinCodeTextField(
            enableActiveFill: true,
            pinTheme: PinTheme(
              borderRadius: BorderRadius.circular(12),
              inactiveColor: kBorderBlack,
              activeColor: kWhite,
              selectedColor: kWhite,
              fieldHeight: (width / 7.55) + 2,
              fieldWidth: width / 7.55,
              activeFillColor: kDarkBlue.withOpacity(0.8),
              inactiveFillColor: kWhite.withOpacity(0.1),
              selectedFillColor: kDarkBlue.withOpacity(0.5),
              shape: PinCodeFieldShape.box,
            ),
            validator: (value) => value!.length < 6 ? '' : null,
            appContext: context,
            length: 6,
            keyboardType: TextInputType.number,
            textStyle: k16Medium,
            onChanged: (pin) {},
          ),
          const SizedBox(height: 24),

          ///Sign In Button
          BlueButton(
              text: "Sign In",
              function: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TabsScaffold.id, (Route<dynamic> route) => false);
              }),

          const SizedBox(height: 24),

          ///Resend OTP
          Center(
            child: InkWell(
              onTap: () async {},
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("Resend OTP", style: k16SemiBold)),
            ),
          ),
        ],
      ),
    );
  }
}
