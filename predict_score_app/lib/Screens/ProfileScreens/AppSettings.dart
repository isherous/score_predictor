import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predict_score_app/Scaffolds/BackButtonScaffold.dart';
import 'package:provider/provider.dart';

import '../../Constants/colors.dart';
import '../../Constants/styles.dart';
import '../../Providers/MainProvider.dart';
import '../../Widgets/SettingsWidget.dart';
import '../AuthScreens/AuthScreen.dart';
import '../AuthScreens/ChangePasswordScreen.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  static const id = "app_settings_screen";

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    return BackButtonScaffold(
      title: "App Settings",
      child: ListView(
        children: [
          const SizedBox(height: 12),

          ///Change Password
          SettingsWidget(
            text: "Change Password",
            onTap: () {
              Navigator.pushNamed(context, ChangePassword.id);
            },
          ),

          ///Delete Your Account
          SettingsWidget(
            text: "Delete Account",
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "Delete your account?",
                        style: k18Bold.copyWith(color: kBlack),
                      ),
                      content: Text(
                          "Are you sure you want to delete your account? All your data will be permanently deleted ",
                          style: k15Medium.copyWith(color: kBlack)),
                      actions: [
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                        ),
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  }).then((value) async {
                if (value != null) {
                  if (value == true) {
                    final navigator = Navigator.of(context);

                    mainProvider.changeShowProgress(true);
                    await Future.delayed(const Duration(milliseconds: 1000));
                    mainProvider.changeShowProgress(false);
                    navigator.pushNamedAndRemoveUntil(
                        AuthScreen.id, (Route<dynamic> route) => false);
                  }
                }
              });
            },
          ),

          ///Log Out
          SettingsWidget(
            text: "Log Out",
            onTap: () async {
              final navigator = Navigator.of(context);
              navigator.pushNamedAndRemoveUntil(
                  AuthScreen.id, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
