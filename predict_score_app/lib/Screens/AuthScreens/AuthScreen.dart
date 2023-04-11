import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:predict_score_app/Constants/values.dart';
import 'package:predict_score_app/Screens/AuthScreens/PhoneAuth.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignInScreen.dart';
import 'package:predict_score_app/Screens/AuthScreens/SignUpScreen.dart';

import '../../Scaffolds/TabsScaffold.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const id = "auth_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Column(
        children: [
          ///Logo and Make Predictions
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: SvgPicture.asset(kLogoSVG)),
                const SizedBox(height: 14),
                Text(
                  "Make Predictions",
                  style: k21Bold,
                )
              ],
            ),
          ),

          ///Auth Buttons and Sign Up Button
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ///Apple
                  AuthButton(
                    text: "Sign In with Apple",
                    iconData: FontAwesomeIcons.apple,
                    onTap: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          TabsScaffold.id, (Route<dynamic> route) => false);
                    },
                  ),

                  const SizedBox(height: 12),

                  ///Google
                  AuthButton(
                    text: "Sign In with Google",
                    iconData: FontAwesomeIcons.google,
                    onTap: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          TabsScaffold.id, (Route<dynamic> route) => false);
                    },
                  ),

                  const SizedBox(height: 12),

                  ///Email
                  AuthButton(
                    text: "Sign In with Email",
                    iconData: FontAwesomeIcons.solidEnvelope,
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  ),
                  const SizedBox(height: 12),

                  ///Phone
                  AuthButton(
                    text: "Sign In with Phone",
                    iconData: FontAwesomeIcons.phone,
                    onTap: () {
                      Navigator.pushNamed(context, PhoneAuth.id);
                    },
                  ),

                  const SizedBox(height: 16),

                  ///Don't have an account? Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: k16Medium),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: Text(
                          "Sign Up",
                          style: k16Medium.copyWith(color: kDarkBlue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  final String text;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: kBorderBlack),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 40),
            Icon(
              iconData,
              color: kWhite,
              size: 18,
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: k15Medium,
                ),
              ),
            ),
            const SizedBox(width: 52),
          ],
        ),
      ),
    );
  }
}
